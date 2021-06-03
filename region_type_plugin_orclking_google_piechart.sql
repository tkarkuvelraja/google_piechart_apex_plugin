prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_210100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.0'
,p_default_workspace_id=>6092874424274203557
,p_default_application_id=>113036
,p_default_id_offset=>0
,p_default_owner=>'ORCLKING'
);
end;
/
 
prompt APPLICATION 113036 - About Oracle and Oracle APEX
--
-- Application Export:
--   Application:     113036
--   Name:            About Oracle and Oracle APEX
--   Date and Time:   19:18 Thursday June 3, 2021
--   Exported By:     TKARKUVELRAJA@GMAIL.COM
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 10475578761255537955
--   Manifest End
--   Version:         21.1.0
--   Instance ID:     63113759365424
--

begin
  -- replace components
  wwv_flow_api.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/region_type/orclking_google_piechart
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(10475578761255537955)
,p_plugin_type=>'REGION TYPE'
,p_name=>'ORCLKING.GOOGLE.PIECHART'
,p_display_name=>'Orclking.Google.Piechart'
,p_supported_ui_types=>'DESKTOP'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'FUNCTION Render_google_piechart (p_region              IN apex_plugin.t_region, ',
'                                 p_plugin              IN apex_plugin.t_plugin, ',
'                                 p_is_printer_friendly IN BOOLEAN) ',
'RETURN apex_plugin.t_region_render_result ',
'AS ',
'  SUBTYPE plugin_attr IS VARCHAR2(32767); ',
'  l_column_value_list apex_plugin_util.t_column_value_list; ',
'  l_region            VARCHAR2(100); -- To keep region static id',
'  l_chart_width       NUMBER; -- To set chart width',
'  l_chart_height      NUMBER; -- To set chart height',
'  l_chart_title       VARCHAR2(60); -- To set chart title',
'  l_is_chart_3d       VARCHAR2(5); -- To define the chart dimension (3d/2d) - True/False',
'  l_data              CLOB; -- To store column values',
'BEGIN ',
'    -- Debug information will be logged when application''s debug mode enabled',
'    IF apex_application.g_debug THEN ',
'      apex_plugin_util.Debug_region (p_plugin => p_plugin, p_region => p_region, ',
'      p_is_printer_friendly => p_is_printer_friendly); ',
'    END IF; ',
'',
'    -- Assign component plugin attributes ',
'    l_chart_width := p_region.attribute_01; ',
'    l_chart_height := p_region.attribute_02; ',
'    l_chart_title := p_region.attribute_03; ',
'    l_is_chart_3d := p_region.attribute_04; ',
'    ',
'    -- Add required javascript libraries',
'    apex_javascript.Add_library( ',
'    p_name => ''https://www.gstatic.com/charts/loader.js'' ',
'    , p_directory => NULL, p_version => NULL, p_skip_extension => TRUE); ',
'',
'    apex_javascript.Add_library(p_name => ''orclking.google.piechart'', ',
'    p_directory => p_plugin.file_prefix, p_version => NULL, ',
'    p_skip_extension => FALSE); ',
'',
'    -- Get region static id ',
'    l_region := CASE ',
'                  WHEN p_region.static_id IS NOT NULL THEN p_region.static_id ',
'                  ELSE ''R'' ',
'                       ||p_region.id ',
'                END; ',
'    ',
'    -- Get data from region source (sql query)',
'    l_column_value_list := apex_plugin_util.Get_data ( ',
'                           p_sql_statement => p_region.source, ',
'                                                  p_min_columns => 2, ',
'                           p_max_columns => 2, ',
'                           p_component_name => p_region.name) ',
'    ; ',
'',
'    apex_json.initialize_clob_output; ',
'    apex_json.open_object; ',
'    apex_json.Open_array(''data''); ',
'    ',
'    -- Write column values in JSON format',
'    FOR i IN 1..L_column_value_list(1).count LOOP ',
'        apex_json.open_object; ',
'        apex_json.WRITE(''region'', l_column_value_list(1)(i)); ',
'        apex_json.WRITE(''val'', To_number(l_column_value_list(2)(i))); ',
'        apex_json.close_object; ',
'    END LOOP; ',
'',
'    apex_json.close_array; ',
'    apex_json.close_object; ',
'    l_data := apex_json.get_clob_output; ',
'    apex_json.free_output; ',
'    ',
'    -- Display the chart inside the <div> element with <div id>',
'    sys.htp.P(''<div id="piechart_div_'' ',
'              ||l_region ',
'              ||''" style="width: 500px; height: 300px;"></div>''); ',
'    ',
'    -- Load data inside the <div> element with <div class>',
'    sys.htp.P(''<div class="piechart-data-'' ',
'              ||l_region ',
'              ||''" style="display: none;">'' ',
'              ||l_data ',
'              ||''</div>''); ',
'',
'    -- Load charts ',
'    apex_javascript.Add_onload_code( ',
'    p_code => ',
'    ''google.charts.load(''''current'''', {''''packages'''': [''''corechart'''']});''); ',
'    ',
'    -- Draw piechart',
'    apex_javascript.Add_onload_code( ',
'    p_code => ''google.charts.setOnLoadCallback(function () {drawPieChart('''''' ',
'              ||l_region ',
'              ||'''''','''''' ',
'              ||l_chart_width ',
'              ||'''''','''''' ',
'              ||l_chart_height ',
'              ||'''''','''''' ',
'              ||l_chart_title ',
'              ||'''''','''''' ',
'              ||l_is_chart_3d ',
'              ||'''''')});''); ',
'              ',
'    RETURN NULL; ',
'END render_google_piechart; '))
,p_api_version=>2
,p_render_function=>'RENDER_GOOGLE_PIECHART'
,p_standard_attributes=>'SOURCE_SQL:AJAX_ITEMS_TO_SUBMIT:FETCHED_ROWS:NO_DATA_FOUND_MESSAGE'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
,p_about_url=>'https://github.com/tkarkuvelraja/google_piechart_apex_plugin'
,p_files_version=>9
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(10476369716734559193)
,p_plugin_id=>wwv_flow_api.id(10475578761255537955)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Chart Width'
,p_attribute_type=>'NUMBER'
,p_is_required=>true
,p_default_value=>'500'
,p_max_length=>4
,p_supported_ui_types=>'DESKTOP'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(10476292330808562607)
,p_plugin_id=>wwv_flow_api.id(10475578761255537955)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Chart Height'
,p_attribute_type=>'NUMBER'
,p_is_required=>true
,p_default_value=>'300'
,p_max_length=>4
,p_supported_ui_types=>'DESKTOP'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(10517221173441632255)
,p_plugin_id=>wwv_flow_api.id(10475578761255537955)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Chart Title'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>'Pie-Chart'
,p_max_length=>60
,p_supported_ui_types=>'DESKTOP'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(10521689358805756227)
,p_plugin_id=>wwv_flow_api.id(10475578761255537955)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'is3D'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'false'
,p_max_length=>5
,p_supported_ui_types=>'DESKTOP'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_std_attribute(
 p_id=>wwv_flow_api.id(10475578989934537958)
,p_plugin_id=>wwv_flow_api.id(10475578761255537955)
,p_name=>'SOURCE_SQL'
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A0D0A202A20476F6F676C65205069652043686172740D0A202A20506C75672D696E20547970653A20526567696F6E0D0A202A2053756D6D6172793A20476F6F676C652076697375616C697A6174696F6E3A20506965436861727420726567696F6E20';
wwv_flow_api.g_varchar2_table(2) := '706C7567696E207573656420746F20646973706C61792076697375616C697A6174696F6E206F66206461746120696E2074686520666F726D206F66207069652063686172742E0D0A202A0D0A202A202D2D2D2D2D20436F6E7461637420696E666F726D61';
wwv_flow_api.g_varchar2_table(3) := '74696F6E202D2D2D2D0D0A202A0D0A202A20446576656C6F706564206279202A204576616C7561746520436F6E73756C74696E672053657276696365732C2042616E67616C6F72650D0A202A20436F6E746163743A20696E666F406576616C7561746563';
wwv_flow_api.g_varchar2_table(4) := '732E636F6D0D0A202A0D0A202A2040617574686F72204B61726B7576656C72616A61205468616E67616D617269617070616E202D20746B61726B7576656C72616A6140676D61696C2E636F6D0D0A202A2050726F66696C653A2068747470733A2F2F7777';
wwv_flow_api.g_varchar2_table(5) := '772E6C696E6B6564696E2E636F6D2F696E2F6B61726B7576656C72616A617468616E67616D617269617070616E0D0A202A20547769747465723A2068747470733A2F2F747769747465722E636F6D2F746B61726B7576656C72616A610D0A202A20426C6F';
wwv_flow_api.g_varchar2_table(6) := '673A20687474703A2F2F6F72636C6B696E672E626C6F6773706F742E636F6D2F0D0A202A2F0D0A0D0A66756E6374696F6E2064726177506965436861727428726567696F6E49642C63686172745F77696474682C63686172745F6865696768742C636861';
wwv_flow_api.g_varchar2_table(7) := '72745F7469746C652C63686172745F69735F336429200D0A7B0D0A20207661722064617461203D206E657720676F6F676C652E76697375616C697A6174696F6E2E446174615461626C6528293B0D0A2020646174612E616464436F6C756D6E2827737472';
wwv_flow_api.g_varchar2_table(8) := '696E67272C2027526567696F6E27293B0D0A2020646174612E616464436F6C756D6E28276E756D626572272C202756616C756527293B0D0A20207661722067446174613D4A534F4E2E7061727365282428226469762E70696563686172742D646174612D';
wwv_flow_api.g_varchar2_table(9) := '222B726567696F6E4964292E68746D6C2829293B0D0A20206966202867446174612E646174612E6C656E6774683E30290D0A20207B0D0A202020202020666F7220287661722069203D20302C206C656E203D2067446174612E646174612E6C656E677468';
wwv_flow_api.g_varchar2_table(10) := '3B2069203C206C656E3B202B2B6929207B0D0A202020202020202020202076617220726563203D2067446174612E646174615B695D3B0D0A20202020202020202020646174612E616464526F77285B7265632E726567696F6E2C7265632E76616C5D293B';
wwv_flow_api.g_varchar2_table(11) := '0D0A202020202020207D0D0A2020207D0D0A20202020200D0A2020202020207661722070696563686172745F6F7074696F6E73203D207B7469746C653A63686172745F7469746C652C0D0A20202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(12) := '202020202020202077696474683A63686172745F77696474682C0D0A2020202020202020202020202020202020202020202020202020202020202020206865696768743A63686172745F6865696768742C0D0A090909090909090920697333443A206368';
wwv_flow_api.g_varchar2_table(13) := '6172745F69735F33647D3B0D0A0909090909090909200D0A092020766172207069656368617274203D206E657720676F6F676C652E76697375616C697A6174696F6E2E506965436861727428646F63756D656E742E676574456C656D656E744279496428';
wwv_flow_api.g_varchar2_table(14) := '2770696563686172745F6469765F272B726567696F6E496429293B0D0A09202070696563686172742E6472617728646174612C2070696563686172745F6F7074696F6E73293B0D0A09200D0A0D0A7D3B';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(10516923082643608430)
,p_plugin_id=>wwv_flow_api.id(10475578761255537955)
,p_file_name=>'orclking.google.piechart.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
