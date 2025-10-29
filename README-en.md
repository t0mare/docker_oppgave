# Mission: Build and run your first container

Welcome to IT Operations! In this task, you will learn the fundamental principle of modern ops: How to package an application (a website) into a **container**, and then run it.

We will use **Play with Docker (PWD)**, which provides a terminal directly in your browser.

---

### Step 1: Prepare the terminal (5 min)

1.  Go to [Play with Docker](https://labs.play-with-docker.com/) and log in with your Docker Hub account.
2.  Click **Start**.
3.  Click **+ ADD NEW INSTANCE** on the left side.
4.  You now have a Linux terminal. **All commands from now on must be written in this terminal.**

---

### Step 2: Get the source code (This project) (5 min)

Now we will "clone" (download) the source code from GitHub to your PWD terminal.

1.  Run this command to download the project:
    ```bash
    git clone https://github.com/t0mare/docker_oppgave.git
    ```

2.  Enter the directory you just downloaded:
    ```bash
    cd docker_oppgave
    ```

3.  List the files you have fetched. You should see `README.md`, `index.html`, and `Dockerfile`.
    ```bash
    ls -l
    ```

---

### Step 3: Build your Docker "Image" (10-15 min)

An **Image** is the "recipe" or "template" for your container. We build it using the `Dockerfile`.

1.  Run the `docker build` command.
    ```bash
    docker build -t my-webserver .
    ```
    * `docker build`: The command to build.
    * `-t my-webserver`: Gives the image a "tag" (a name) we can use later.
    * `.` (a period): Means "look for a `Dockerfile` in the current directory".

2.  You will see Docker download `nginx` (the base image) and then run the `COPY` command from our `Dockerfile`.

3.  Check that your image has been built:
    ```bash
    docker images
    ```
    (You should see `my-webserver` in the list).

---

### Step 4: Run your container! (10 min)

Now we will "start" the image. When an image is running, it is called a **container**.

1.  Run the `docker run` command:
    ```bash
    docker run -d -p 80:80 my-webserver
    ```
    * `docker run`: The command to start.
    * `-d`: "Detached mode" (run in the background).
    * `-p 80:80`: "Publish port". Connects port **80** on the PWD machine to port **80** *inside* the container (where Nginx is listening).

2.  **See the result!** Next to your instance name in PWD, a blue **[ 80 ]** link will appear. **Click it.**

3.  You should now see your "Hello World" page! Congratulations!

4.  Check that the container is running:
    ```bash
    docker ps
    ```
    (This shows all currently running containers).

---

### ⭐ Bonus Task: Making an update (15-20 min)

In real-world operations, we need to update things. Let's change the website.

1.  Use a simple text editor (nano) to change the greeting:
    ```bash
    nano index.html
    ```

2.  Change `<h1>Hello World! 👋</h1>` to `<h1>I have updated my site! 🚀</h1>`.
3.  Save and exit `nano` (Press **Ctrl+X**, then **Y**, then **Enter**).

4.  **IMPORTANT:** You must stop and remove the *old* container before you can start a new one on the same port.
    * Find the ID of the running container: `docker ps`
    * Stop it: `docker stop [Container-ID or name here]`
    * Remove it: `docker rm [Container-ID or name here]`

5.  Re-build the image with your changes:
    ```bash
    docker build -t my-webserver .
    ```
    (Notice how much faster it is now! Docker "caches" the layers).

6.  Start the new container:
    ```bash
    docker run -d -p 80:80 my-webserver
    ```

7.  **Check the result:** Go to the blue **[ 80 ]** link again (or reload the page). You should now see your new text!
