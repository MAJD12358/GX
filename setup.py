from setuptools import setup, find_packages

setup(
    name='gx',
    version='1.0.0',
    packages=find_packages(),
    install_requires=[
        # قائمة بالتبعيات إذا كانت هناك
    ],
    entry_points={
        'console_scripts': [
            'gx=gx:main',
        ],
    },
)
