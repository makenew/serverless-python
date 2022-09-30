Serverless Python Project Skeleton
==================================

|PyPI| |GitHub Actions|

.. |PyPI| image:: https://img.shields.io/pypi/v/makenew-serverless-python.svg
   :target: https://pypi.python.org/pypi/makenew-serverless-python
   :alt: PyPI
.. |GitHub Actions| image:: https://github.com/makenew/serverless-python/workflows/main/badge.svg
   :target: https://github.com/makenew/serverless-python/actions
   :alt: GitHub Actions

Package skeleton for a Python Serverless project on AWS Lambda.

Description
-----------

Bootstrap a new Python_ Serverless project in five minutes or less.

.. _Python: https://www.python.org/

Features
~~~~~~~~

- Deploy to `AWS Lambda`_ with Serverless_.
- Publishing to PyPI_.
- Secure dependency management with Poetry_.
- Linting with Pylint_.
- Uncompromising code formatting with Black_.
- pytest_ helps you write better programs.
- Code coverage reporting with Codecov_.
- Continuous testing and deployment with `GitHub Actions`_.
- `Keep a CHANGELOG`_.
- Consistent coding with EditorConfig_.
- Badges from Shields.io_.

.. _AWS Lambda: https://aws.amazon.com/lambda/
.. _Black: https://black.readthedocs.io/en/stable/
.. _Codecov: https://codecov.io/
.. _EditorConfig: https://editorconfig.org/
.. _GitHub Actions: https://github.com/features/actions
.. _Keep a CHANGELOG: https://keepachangelog.com/
.. _PyPI: https://pypi.python.org/pypi
.. _Pylint: https://www.pylint.org/
.. _Serverless: https://serverless.com/
.. _Shields.io: https://shields.io/
.. _pytest: https://docs.pytest.org/

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

4. Create the required GitHub repository secrets
5. Review, commit, and push the changes to GitHub with

   ::

     $ git diff --cached
     $ git commit -m "Replace makenew boilerplate"
     $ git remote add origin git@github.com:<user>/<new-serverless-python>.git
     $ git push -u origin master

6. Ensure the GitHub action passes,
   then release the initial version with

   ::

     $ npm install
     $ poetry install
     $ poetry version patch
     $ make version

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
as makenew-serverless-python_.

Install it with

::

    $ poetry add makenew-serverless-python

.. _makenew-serverless-python: https://pypi.python.org/pypi/makenew-serverless-python
.. _Python Package Index (PyPI): https://pypi.python.org/

Development and Testing
-----------------------

Quickstart
~~~~~~~~~~

::

    $ git clone https://github.com/makenew/serverless-python.git
    $ cd serverless-python
    $ poetry install

Run each command below in a separate terminal window:

::

    $ make watch

Primary development tasks are defined in the `Makefile`.

Source Code
~~~~~~~~~~~

The `source code`_ is hosted on GitHub.
Clone the project with

::

    $ git clone https://github.com/makenew/serverless-python.git

.. _source code: https://github.com/makenew/serverless-python

Requirements
~~~~~~~~~~~~

You will need `Python 3`_ and Poetry_ and Node.js_ with npm_.
To run some Serverless commands you will need Docker_.

Install the development dependencies with

::

    $ poetry install
    $ npm install

.. _Docker: https://www.docker.com/
.. _Node.js: https://nodejs.org/
.. _npm: https://www.npmjs.com/
.. _Poetry: https://poetry.eustace.io/
.. _Python 3: https://www.python.org/

Tests
~~~~~

Lint code with

::

    $ make lint


Run tests with

::

    $ make test

Run tests on changes with

::

    $ make watch

Publishing
~~~~~~~~~~

Use the `poetry version`_ command to release a new version.
Then run `make version` to commit and push a new git tag
which will trigger a GitHub action.

Publishing may be triggered using on the web
using a `workflow_dispatch on GitHub Actions`_.

.. _Poetry version: https://python-poetry.org/docs/cli/#version
.. _workflow_dispatch on GitHub Actions: https://github.com/makenew/pypackage/actions?query=workflow%3Aversion

Deployment
~~~~~~~~~~

Serverless deployment is triggered by a release repository_dispatch on GitHub Actions.

Deployment may be triggered using on the web
using a `release workflow_dispatch on GitHub Actions`_.

.. _release workflow_dispatch on GitHub Actions: https://github.com/makenew/serverless-python/actions?query=workflow%3Arelease

GitHub Actions
--------------

*GitHub Actions should already be configured: this section is for reference only.*

The following repository secrets must be set on GitHub Actions.

- ``PYPI_API_TOKEN``: API token for publishing on PyPI.
- ``AWS_DEFAULT_REGION``: The AWS region Serverless will deploy to.
- ``AWS_ACCESS_KEY_ID``: AWS access key ID.
- ``AWS_SECRET_ACCESS_KEY``: AWS secret access key.
- ``GH_TOKEN``: A personal access token that can trigger workflows.

These must be set manually.

Secrets for Optional GitHub Actions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The version and format GitHub actions
require a user with write access to the repository.
including access to trigger workflows.
Set these additional secrets to enable the action:

- ``GH_USER``: The GitHub user's username.
- ``GH_TOKEN``: A personal access token for the user.
- ``GIT_USER_NAME``: The name to set for Git commits.
- ``GIT_USER_EMAIL``: The email to set for Git commits.
- ``GPG_PRIVATE_KEY``: The `GPG private key`_.
- ``GPG_PASSPHRASE``: The GPG key passphrase.

.. _GPG private key: https://github.com/marketplace/actions/import-gpg#prerequisites

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
