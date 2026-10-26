from setuptools import setup, find_packages

setup(
    name='apiverve_meteoritelandings',
    version='1.2.3',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'requests',
        'setuptools'
    ],
    description='Meteorite Landings searches recorded meteor strikes by specimen name and minimum mass. Each record includes the official specimen name, meteorite classification, mass in grams, and the recorded fall year.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://apiverve.com/marketplace/meteorites?utm_source=pypi&utm_medium=referral&utm_content=homepage',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)
