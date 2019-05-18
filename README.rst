Serverless Python Project Skeleton
==================================

|PyPI| |Codecov| |CircleCI|

.. |PyPI| image:: https://img.shields.io/pypi/v/makenew-serverless-python.svg
   :target: https://pypi.python.org/pypi/makenew-serverless-python
   :alt: PyPI
.. |Codecov| image:: https://img.shields.io/codecov/c/github/makenew/serverless-python.svg
   :target: https://codecov.io/gh/makenew/serverless-python
   :alt: Codecov
.. |CircleCI| image:: https://img.shields.io/circleci/project/github/makenew/serverless-python.svg
   :target: https://circleci.com/gh/makenew/serverless-python
   :alt: CircleCI

Package skeleton for a Python Serverless project on AWS Lambda.

Description
-----------

Bootstrap a new Python_ Serverless project in five minutes or less.

.. _Python: https://www.python.org/

Features
~~~~~~~~

- Deploy to `AWS Lambda`_ under a `custom domain`_ with Serverless_.
- Package management with setuptools_ and publishing to PyPI_.
- Secure dependency management with Pipenv_.
- Linting with Pylint_.
- pytest_ helps you write better programs.
- Code coverage reporting with Codecov_.
- CircleCI_ ready.
- `Keep a CHANGELOG`_.
- Consistent coding with EditorConfig_.
- Badges from Shields.io_.

.. _AWS Lambda: https://aws.amazon.com/lambda/
.. _Codecov: https://codecov.io/
.. _EditorConfig: https://editorconfig.org/
.. _Keep a CHANGELOG: https://keepachangelog.com/
.. _PyPI: https://pypi.python.org/pypi
.. _Pylint: https://www.pylint.org/
.. _Serverless: https://serverless.com/
.. _Shields.io: https://shields.io/
.. _custom domain: https://github.com/amplify-education/serverless-domain-manager
.. _pytest: https://docs.pytest.org/
.. _setuptools: https://pythonhosted.org/setuptools/.

Bootstrapping a New Project
~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. Create an empty (**non-initialized**) repository on GitHub.
2. Clone the master branch of this repository with

   ::

       $ git clone --single-branch https://github.com/makenew/serverless-python.git new-serverless-python
       $ cd new-serverless-python

   Optionally, reset to the latest
   `release <https://github.com/makenew/serverless-python/releases>`__ with

   ::

       $ git reset --hard v1.2.0

3. Run

   ::

       $ ./makenew.sh

   This will replace the boilerplate, delete itself,
   remove the git remote, remove upstream tags,
   and stage changes for commit.

4. Create the required CircleCI environment variables with

   ::

       $ .circleci/envvars.sh

5. Review, commit, and push the changes to GitHub with

   ::

     $ git diff --cached
     $ git commit -m "Replace makenew boilerplate"
     $ git remote add origin git@github.com:<user>/<new-serverless-python>.git
     $ git push -u origin master

6. Ensure the CircleCI build passes,
   then publish the initial version of the package with

   ::

     $ pipenv install --dev
     $ pipenv run bumpversion patch
     $ git push
     $ git push --tags

7. Ensure a valid certificate exists in `AWS Certificate Manager`_
   that matches the custom deployment domains,
   e.g., this project uses a wildcard certificate for
   ``*.serverless-python.makenew.razorx.app``.
   Then trigger a deploy to the test stage with

   ::

     $ npm install
     $ npm run release:test

.. _AWS Certificate Manager: https://aws.amazon.com/certificate-manager/

Updating
~~~~~~~~

If you want to pull in future updates from this skeleton,
you can fetch and merge in changes from this repository.

Add this as a new remote with

::

    $ git remote rename origin upstream

and then configure your ``origin`` branch as normal.

Otherwise, add this as a new remote with

::

    $ git remote add upstream git@github.com:makenew/serverless-python.git

You can then fetch and merge changes with

::

    $ git fetch --no-tags upstream
    $ git merge upstream/master

Changelog
^^^^^^^^^

Note that ``CHANGELOG.md`` is just a template for this skeleton. The
actual changes for this project are documented in the commit history and
summarized under
`Releases <https://github.com/makenew/serverless-python/releases>`__.

Installation
------------

This package is registered on the `Python Package Index (PyPI)`_
as makenew_serverless_python_.

Install it with

::

    $ pipenv install makenew_serverless_python

If you are writing a Python package which will depend on this,
add this to your requirements in ``setup.py``.

.. _makenew_serverless_python: https://pypi.python.org/pypi/makenew-serverless-python
.. _Python Package Index (PyPI): https://pypi.python.org/

Development and Testing
-----------------------

Quickstart
~~~~~~~~~~

::

    $ git clone https://github.com/makenew/serverless-python.git serverless-python
    $ cd serverless-python
    $ pipenv install --dev
    $ npm install

Run each command below in a separate terminal window:

::

    $ make watch

Primary development tasks are defined in the `Makefile`.

Source Code
~~~~~~~~~~~

The `source code_` is hosted on GitHub.
Clone the project with

::

    $ git clone https://github.com/makenew/serverless-python.git

.. _source_code: https://github.com/makenew/serverless-python

Requirements
~~~~~~~~~~~~

You will need `Python 3`_ with Pipenv_ and Node.js_ with npm_.
To run some Serverless commands you will need Docker_.

Install the development dependencies with

::

    $ pipenv install --dev
    $ npm install

.. _Docker: https://www.docker.com/
.. _Node.js: https://nodejs.org/
.. _npm: https://www.npmjs.com/
.. _Pipenv: https://pipenv.readthedocs.io/
.. _Python 3: https://www.python.org/

Tests
~~~~~

Lint code with

::

    $ make lint


Run tests with

::

    $ make test

Run tests on chages with

::

    $ make watch

Publishing
~~~~~~~~~~

Use the bumpversion_ command to release a new version.
Push the created git tag which will trigger a CircleCI publish job.

.. _bumpversion: https://github.com/peritus/bumpversion

Deployment
~~~~~~~~~~

Deployment is triggered on CircleCI when a git tag matching
``stage.<environment>`` is created or updated.
Use ``npm run release:<environment>`` to do this automatically, e.g.,

::

  $ npm run release:test

CircleCI Setup
--------------

*CircleCI should already be configured: this section is for reference only.*

The following environment variables must be set on CircleCI_:

- ``TWINE_USERNAME``: Username for publishing on PyPI.
- ``TWINE_PASSWORD``: Password for publishing on PyPI.
- ``CODECOV_TOKEN``: Codecov token for uploading coverage reports (optional).
- ``AWS_DEFAULT_REGION``: The AWS region Serverless will deploy to.
- ``AWS_ACCESS_KEY_ID``: AWS access key ID.
- ``AWS_SECRET_ACCESS_KEY``: AWS secret access key.

These may be set manually or by running the script ``./circleci/envvars.sh``.

.. _CircleCI: https://circleci.com/

Contributing
------------

Please submit and comment on bug reports and feature requests.

To submit a patch:

1. Fork it (https://github.com/makenew/serverless-python/fork).
2. Create your feature branch (`git checkout -b my-new-feature`).
3. Make changes.
4. Commit your changes (`git commit -am 'Add some feature'`).
5. Push to the branch (`git push origin my-new-feature`).
6. Create a new Pull Request.

License
-------

This Serverless project is licensed under the MIT license.

Warranty
--------

This software is provided by the copyright holders and contributors "as is" and
any express or implied warranties, including, but not limited to, the implied
warranties of merchantability and fitness for a particular purpose are
disclaimed. In no event shall the copyright holder or contributors be liable for
any direct, indirect, incidental, special, exemplary, or consequential damages
(including, but not limited to, procurement of substitute goods or services;
loss of use, data, or profits; or business interruption) however caused and on
any theory of liability, whether in contract, strict liability, or tort
(including negligence or otherwise) arising in any way out of the use of this
software, even if advised of the possibility of such damage.
