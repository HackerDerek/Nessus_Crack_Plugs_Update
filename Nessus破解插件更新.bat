@echo off
mode con cols=120 lines=40
title Nessus�������v0.5 by:�峿
color 0a
echo.
echo =============================================��ܰ��ʾ=============================================
echo.
echo 1��������ֻ�ܸ��£���װ��Ĭ�ϰ�װ��C�̵�Nessus�����
echo.
echo 2��������������Ҫ�Թ���Ա������У����Ҽ��Թ���Ա������б�����
echo.
echo ==================================================================================================
echo.
echo ***�밴���������***
pause >nul

if exist "C:\Program Files\Tenable\Nessus\nessuscli.exe" (
	echo.
	echo [*] ����nessuscli.exe���򣬳������ִ�С�
) else ( echo.
	echo [-] ����ϵͳû�а�װNessus����Nessusû�и���Ĭ�ϰ�װ��C�̡�
	echo.
	echo �밴������˳���
	pause >nul
	exit
)
if exist "C:\ProgramData\Tenable\Nessus\nessus\plugins" (
	echo.
	echo [*] ����pluginsĿ¼���������ִ�С�
) else ( echo.
	echo [-] û���ҵ�pluginsĿ¼��ϵͳ��װNessus���ܲ���ȷ��
	echo.
	echo �밴������˳���
	pause >nul
	exit
)
:inputPluginPath
echo.
echo ���������ľ���·�����磺C:\Users\Administrator\Desktop\all-2.0_202112192017.tar.gz
echo.
set /p plugin=�����������ľ���·����
if exist "%plugin%" goto start
echo.
echo [-] ����Ĳ��·�������ڣ����������룡
goto inputPluginPath

:start
echo.
echo [*] ֹͣNessus����
echo.
net stop "Tenable Nessus"
echo [*] ȥ��֮ǰ��װ�Ĳ��ֻ�������غ�ϵͳ����Ȩ�ޣ����Եȡ�����
echo.
attrib -s -r -h "C:\ProgramData\Tenable\Nessus\nessus\plugins\*.*"
echo [*] ȥ��plugin_feed_info.incȨ��
echo.
attrib -s -r -h "C:\ProgramData\Tenable\Nessus\nessus\plugin_feed_info.inc"
if exist "C:\ProgramData\Tenable\Nessus\nessus\templates\settings.json" (
	echo [*] ȥ��templatesĿ¼��json�ļ���Ȩ��
	echo.
	attrib -s -r -h "C:\ProgramData\Tenable\Nessus\nessus\templates\*.json"
	attrib -s -r -h "C:\ProgramData\Tenable\Nessus\nessus\templates\tmp\*.json"
	echo.
)
echo [*] ��װ/����Nessus��������Եȡ�����
echo.
"C:\Program Files\Tenable\Nessus\nessuscli.exe" update "%plugin%"
echo.
set /p ver=���������������º���ʾ�Ĳ���汾(ǧ��Ҫ��������)��
echo.
echo [*] �޸�plugin_feed_info.inc�ļ�
echo PLUGIN_SET = "%ver%"; >C:\ProgramData\Tenable\Nessus\nessus\plugins\plugin_feed_info.inc
echo PLUGIN_FEED = "ProfessionalFeed (Direct)"; >>C:\ProgramData\Tenable\Nessus\nessus\plugins\plugin_feed_info.inc
echo PLUGIN_FEED_TRANSPORT = "Tenable Network Security Lightning"; >>C:\ProgramData\Tenable\Nessus\nessus\plugins\plugin_feed_info.inc
echo PLUGIN_SET = "%ver%"; >C:\ProgramData\Tenable\Nessus\nessus\plugin_feed_info.inc
echo PLUGIN_FEED = "ProfessionalFeed (Direct)"; >>C:\ProgramData\Tenable\Nessus\nessus\plugin_feed_info.inc
echo PLUGIN_FEED_TRANSPORT = "Tenable Network Security Lightning"; >>C:\ProgramData\Tenable\Nessus\nessus\plugin_feed_info.inc
echo.
echo [*] ���Ӳ��ֻ�������غ�ϵͳ����Ȩ�ޣ����Եȡ�����
echo.
attrib +s +r +h "C:\ProgramData\Tenable\Nessus\nessus\plugins\*.*"
echo [*] ����plugin_feed_info.incȨ�ޡ�
echo.
attrib +s +r +h "C:\ProgramData\Tenable\Nessus\nessus\plugin_feed_info.inc"
echo [*] ȥ��pluginsĿ¼�µ�plugin_feed_info.incȨ�ޡ�
echo.
attrib -s -r -h "C:\ProgramData\Tenable\Nessus\nessus\plugins\plugin_feed_info.inc"
echo [*] ����Nessus����
echo.
net start "Tenable Nessus"
echo.
echo [+] Nessus���������ɣ�
echo.
echo ����Nessus�����Nessus����û����ȫ����������Ҫ�ȴ�������ʱ�䡣
echo �ȴ�10������������� https://127.0.0.1:8834/ ���� https://localhost:8834/ �鿴����Ͳ�����������
echo.
echo �밴������˳���
pause >nul