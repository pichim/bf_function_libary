function fig_nr = expand_multiple_figure_nr(ini_fig_nr, multp_fig_nr)
% figNr = get_multiple_figure_nr(iniFigNr, multpFigNr)
% 
% Examples:
% get_multiple_figure_nr(1,1) = 1
% get_multiple_figure_nr(2,2) = 22
% get_multiple_figure_nr(3,3) = 333

    if multp_fig_nr == 1
        fig_nr = ini_fig_nr;
        return
    else
        fig_nr_str = num2str(ini_fig_nr);
        for i = 1:multp_fig_nr-1
            fig_nr_str = [fig_nr_str, num2str(ini_fig_nr)]; %#ok
        end
    end
    fig_nr = str2double(fig_nr_str);

end

