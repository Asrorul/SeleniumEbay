class function(object):

    ROBOT_LIBRARY_VERSION = 1.0

    def __init__(self):
        pass

    def enable_download_in_headless_chrome(self, driver, download_dir):
        driver.command_executor._commands["send_command"] = ("POST", '/session/$sessionId/chromium/send_command')
        params = {'cmd': 'Page.setDownloadBehavior', 'params': {'behavior': 'allow', 'downloadPath': download_dir}}
        command_result = driver.execute("send_command", params)
        print("response from browser:")
        for key in command_result:
            print("result:" + key + ":" + str(command_result[key]))