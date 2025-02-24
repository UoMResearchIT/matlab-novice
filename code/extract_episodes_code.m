function extract_episodes_code(episode_names,q)
% extract_episodes_code
%   This function extracts code blocks delimited by "```matlab" and "```".
%   If an episode_name is given, it only does so for that file. 
%   Otherwise, it will iterate through the "*.md" files in "episodes/"
%
%   The extracted code blocks are saved in the "code" folder.
%
%   Usage:
%   - Add the 'code' and 'episodes' directories to MATLAB's path.
%   - To extract the code from all episodes, run on the console:
%     >> extract_episodes_code()

    quiet=false;
    if ~exist("episode_names","var")
        % Create the list of episodes files
        episode_files = dir('episodes/*.md');
        episode_names = string(zeros(size(episode_files)));
        for i = 1:length(episode_files)
            episode_names(i)="episodes/"+string(episode_files(i).name);
        end
    end

    % Create the "code" folder if it does not exist
    if ~exist('code', 'dir')
        mkdir('code');
    end

    % Extract the code blocks from each episode
    for i = 1:length(episode_names)
        if ~quiet
            disp("Processing episode "+episode_names(i))
        end

        % Get the episode
        episode_fid = fopen(episode_names(i), 'r');
        if episode_fid == -1
            % Try inside episodes/
            episode_fid = fopen("episodes/"+episode_names(i), 'r');
            if episode_fid == -1
                error('Failed to open the file.');
            end
        end

        % Read the file line by line
        in_code_block=false;
        code_blocks=[];
        while ~feof(episode_fid)
            line = fgetl(episode_fid);
            % Check for the start of a code block
            if startsWith(line, '```matlab')
                in_code_block = true;
                code_block = ['```matlab']; % Reset codeBlock
            elseif in_code_block 
                if startsWith(line, '```')
                    in_code_block = false;
                    % Append full codeBlock to codeblock array
                    code_block = [code_block; "```"];
                    code_blocks = [code_blocks; code_block];
                else
                    % Accumulate lines within the code block
                    code_block = [code_block; "  "+ string(line)];
                end
            end
            % Adds empty lines with ::: delimiters
            if startsWith(line, ':::')
                if contains(line, 'challenge')
                    code_blocks = [code_blocks; ""; "% ! Challenge:"];
                elseif contains(line, 'solution')
                    code_blocks = [code_blocks; "% !! Solution:"];
                else
                    code_blocks = [code_blocks; ""];
                end
            end
            % Adds headers
            if startsWith(line, '#')
                code_blocks = [code_blocks; "% " + string(line)];
            end
        end
        % Close the file
        fclose(episode_fid);

        % Write code blocks to markdown file
        output_file_name="code/"+strrep(episode_names(i), "episodes/", '');
        output_file_name=strrep(output_file_name, ".md", '.m');
        out_fid = fopen(output_file_name, 'w+');
        if episode_fid == -1
            error('Failed to save to file %s', output_file_name);
        end
        try
            in_script=false;
            for j = 1:length(code_blocks)
                stripped_line=strrep(code_blocks(j), ">> ", '');
                if stripped_line == "```" || stripped_line == "```matlab"
                    if in_script
                        in_script=false;
                        fprintf(out_fid, '%s\n', "----------------------------------------");
                    end
                    continue
                end
                if contains(stripped_line,"*Script*") || contains(stripped_line,"function ")
                    in_script=true;
                    fprintf(out_fid, '%s\n', "----------------------------------------");
                end
                if stripped_line == code_blocks(j) && ...
                        stripped_line ~= "" && ...
                        ~(startsWith(stripped_line,"%")) && ...
                        ~quiet && ...
                        ~in_script
                    disp("Detected a line without leading >> : "+stripped_line)
                end
                if stripped_line == "  "
                    stripped_line = "";
                end
                fprintf(out_fid, '%s\n', stripped_line);
            end
        catch
            % Handle any potential errors during the writing process
            error('Failed to write code blocks to file %s', output_file_name);
        end
        
        % Close the file
        fclose(out_fid);
    end
end