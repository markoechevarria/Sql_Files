"""
>>> import shutil, os
>>> from pathlib import Path
>>> p = Path.home()
>>> shutil.copy(p / 'spam.txt', p / 'some_folder')
>>> shutil.copy(p / 'eggs.txt', p / 'some_folder/eggs2.txt')

>>> import shutil, os
>>> from pathlib import Path
>>> p = Path.home()
>>> shutil.copytree(p / 'spam', p / 'spam_backup')

>>> import shutil
>>> shutil.move('C:\\bacon.txt', 'C:\\eggs')

os.unlink(file) -> remove a file

"""



