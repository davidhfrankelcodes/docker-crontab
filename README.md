# docker-crontab  
**It's crontab but in a container. No ports. No GUI. No BS. Just cron in a container. Why?**  
Because someone decided that setting up cron jobs the normal way wasn't edgy enough. Now you get to deal with Docker AND cron at the same time. You're welcome.

---

## **What is this sorcery?**
This is your average, everyday `crontab` setup, except shoved into a Docker container. It runs your scheduled tasks like cron does. But hey, it's in a container. Why? Because we can.

---

## **How to Use This Masterpiece**

### 1. **Set It Up**
First, clone this bad boy and run the init script to make some directories:
```bash
git clone <repository-url>
cd docker-crontab
./init.sh
```

### 2. **Customize Your Setup**
- **Crontab:**  
  Copy `crontab.example` to `crontab` and edit it with your favorite editor (or use the default `nano` because who doesn't love `nano`?).  
  **Example:**
  ```bash
  cp crontab.example crontab
  nano crontab
  ```
- **Scripts:**  
  Dump your magnificent bash scripts into the `scripts/` directory.  
  **Example:** Add a script called `backup.sh`:
  ```bash
  echo "#!/bin/sh\n echo 'Backing up...'" > scripts/backup.sh
  chmod +x scripts/backup.sh
  ```
- **Logs:**  
  The `logs/` directory will store all your job logs because troubleshooting is a way of life.

- **Packages:**  
  Only `bash`, `nano`, and `docker` commands come preinstalled (See Dockerfile). Otherwise it's stock Alpine Linux. If you need additional Alpine packages, list them in `apk-requirements.txt`:
  ```bash
  echo "curl" >> apk-requirements.txt
  ```

### 3. **Build the Container**
Fire up Docker Compose and let the magic happen:
```bash
docker compose build
```

### 4. **Run It**
Spin up your shiny new cron container:
```bash
docker compose up -d
```

---

## **Helpful Commands**  

Here's your cheat sheet for dealing with this containerized cron monster:

1. **List the Crontab (From Inside the Container)**  
   See the schedule of doom you've created:
   ```bash
   docker exec -it docker-crontab crontab -l
   ```

2. **Edit the Crontab safely (From Inside the Container)**  
   See the schedule of doom you've created:
   ```bash
   docker exec -it docker-crontab crontab -e
   ```

3. **Manually Test a Cron Job (Inside the Container)**  
   Run your script to make sure it actually works:
   ```bash
   docker exec -it docker-crontab /scripts/test.sh
   ```

4. **View Cron Logs**  
   Gaze upon the glory of your logs:
   ```bash
   tail -f logs/test/test.log
   ```

5. **Edit the Crontab (Host Machine)**  
   You want to live dangerously? Edit it directly:
   ```bash
   nano crontab
   ```

6. **Rebuild the Container**  
   Because nothing ever works right the first time:
   ```bash
   docker compose build
   ```

7. **Restart the Container**  
   When in doubt, restart everything:
   ```bash
   docker compose restart
   ```

8. **Check Running Containers**  
   Make sure it's still alive:
   ```bash
   docker ps
   ```

9. **Enter the Container**  
   Get inside and pretend you know what you're doing:
   ```bash
   docker exec -it docker-crontab sh
   ```

10. **Check if Cron is Running**  
   Because cron sometimes likes to take a vacation:
   ```bash
   docker exec -it docker-crontab ps aux | grep crond
   ```

11. **Run a One-Off Script**  
    You’re feeling bold, huh?
    ```bash
    docker exec -it docker-crontab sh -c "/scripts/backup.sh"
    ```

12. **Install a Package On-the-Fly**  
    Need something? Add it live:
    ```bash
    docker exec -it docker-crontab apk add vim
    ```

13. **Destroy Everything**  
    When you've had enough of this nonsense:
    ```bash
    docker compose down
    ```

---

## **How Do I Know It Works?**

Try this inside the container to confirm everything is functional:
```bash
docker exec -it docker-crontab sh -c "crontab -l && echo 'Cron is running' && ps aux | grep crond"
```

If you see your crontab and a running cron daemon, you're golden. If not, it's time to stare at your logs and pretend to know what's going on.

---

## **Why Even Use This?**

Because life wasn't complicated enough with regular cron. Now you can containerize it, bind mount a dozen directories, and make your logs "portable." Welcome to DevOps! 🎉

You're now equipped with everything you need to run cron jobs in Docker. Go forth and automate like a true grumpy old sysadmin.
