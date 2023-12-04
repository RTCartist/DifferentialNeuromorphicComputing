from PyLTSpice import SimRunner, SpiceEditor

runner = SimRunner(output_folder='./new/predict/th3')
origin_path = 'F:\\visualpredict\\1\\greycut\\pwlreal\\'
for row_i in range(33, 46):
    for col_j in range(1, 97):
        netlist = SpiceEditor("visual627.asc")
        netlist.add_instructions(".tran 0 460 0 0.01")
        value_settings = {'vup': 0.16, 'vun': 0.01, 'bia1': 0.12, 'plus1': 1, 'bia2': 0.14, 'plus2': 1, 'bia0': -0.10}
        netlist.set_parameters(**value_settings)
        pwl_file_name = '{}_{}.txt'.format(row_i, col_j)
        netlist.set_component_value('V1', 'PWL file=' + origin_path + pwl_file_name)
        run_netlist_file = "{}_{}.net".format(row_i, col_j)
        raw, log = runner.run_now(netlist, run_filename=run_netlist_file)
