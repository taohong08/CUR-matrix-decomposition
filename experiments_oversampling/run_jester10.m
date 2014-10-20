load('jester_data_1.mat');
in.A = jester_data_1;

in.k = 10;
in.c = 100;
in.r = 100;
in.q = 20;

in.sigma_k = 1;
in.froerr = 1;
in.froerr_k = 1;
in.specerr = 1;
in.specerr_k = 1;

in.adaptive = 0;

methods = {'subspace_expected','deterministic'};
p_values = (10:20);

s = svds(in.A,p_values(end));
plot(p_values,s(p_values(1):end)./s(p_values(1)));
title('singular value decay');
export_fig('./plots/decay_jester10.pdf');
close all;

out = run_dataset_different_p(in,methods,p_values);

save('./output/p_plots_jester10')

p_values_plot_subspace_expected;
saveas(gcf,'./plots/p_plots_jester10_expected','fig');
export_fig(gcf,'./plots/p_plots_jester10_expected.pdf');
close all;

p_values_plot_deterministic;
saveas(gcf,'./plots/p_plots_jester10_deterministic','fig');
export_fig(gcf,'./plots/p_plots_jester10_deterministic.pdf');
close all;