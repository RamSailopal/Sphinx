## Containerised Sphinx Environment

A Docker container Sphinx environment for generating html/pdf from mark down files.

# Running the container

    git clone https://github.com/RamSailopal/Sphinx
    cd Sphinx
    docker run --name Vista-Sphinx -d -v "$PWD/share:/home/sphinx" -p "3090:80" --entrypoint /home/sphinx/entrypoint.sh ubuntu

# Creating new Mark Down content

Add a new md file in the docs folder and then amend **index.rst**, adding the new file name (without the .md extension) under **.. toctree::** (Ensure a space exists)

# Building Changes

To build html, run
    
    docker exec -it Vista-Sphinx /home/sphinx/build.sh html

To build pdf:

    docker exec -it Vista-Sphinx /home/sphinx/build.sh pdf

Monitor, the output as this will tell you the pdf file name generated i.e
    
    *Latexmk: Log file says output to 'Test.pdf'

With the name of the pdf file, navigate to: http://localhost:3090/test.pdf to view the pdf document

To build both html and pdf:

    docker exec -it Vista-Sphinx /home/sphinx/build.sh both

# References

https://cerodell.github.io/sphinx-quickstart-guide/build/html/quickstart.html
    

