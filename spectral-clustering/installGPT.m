function installGPT()
    % https://github.com/alecjacobson/gptoolbox
    folders = ["external", "imageprocessing", "images", "matrix", "mesh", "mex", "quat", "utility", "wrappers"];


    for k = 1:length(folders)
        addpath(strjoin(strcat(['gplottoolbox/'], folders(k)),':'))
    end
    
    savepath

end
  