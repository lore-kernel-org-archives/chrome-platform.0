Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E392F21
	for <chrome-platform@lists.linux.dev>; Wed,  9 Feb 2022 05:11:38 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id g205-20020a2552d6000000b0061e1843b8edso1408597ybb.18
        for <chrome-platform@lists.linux.dev>; Tue, 08 Feb 2022 21:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=Cna2HlQGqwxmAqlvcQnVN0/MaPqKJG7oMkmFC9eYLOw=;
        b=V5/CRseVq2wXnLUtrPvL1kBbxF16V/xww8j6u8h4CiH6lRKwhGpVH+zRi1erd75pKu
         nxllmp7gS3+dRkXHTYv1ssdiKi4P997uY0H/xLk0LaqF0YOiGonghHrqnVoaW1HUspfn
         EDUi5hckK8U3u5iRHgrDXIIKKKMfBSiP7+01Ci537vh2lmJ+p1F1X46ZUODciembeg2b
         Yw4mnw9MkjgTb1A4aMwc1zyJFKS4XidN0Cxbsyh04rUIunMKaanhP5vly+YJF8ZPvtoq
         BrSGj3/9NI3UPjqh7IO/7aw8B5HdF5p5E+zicU5TTT78AGR6cSAgmrBKTwY5HEb466j8
         83Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=Cna2HlQGqwxmAqlvcQnVN0/MaPqKJG7oMkmFC9eYLOw=;
        b=41OQhX4WYhIfMZzs0lnxrH6mDI+VLTXApopAgHOzZ7E4FJOz3oGXVT1URgVd8VYNRV
         cvK8+7IaKFEIwoKXuY3/4pYbmrhm7JXz5AJZ32/Tiqo6b8th/k9399frxmxJXpL3Aefj
         zeozcGf5ycp0qg39dUTJw8mgkiWsbk78jEkCoEYQzHjqQhqxkLoxyqGOX/6Sk6dMwsCA
         KqANOEnN+lp9vrvb0IDMIbJDGgZxc+Ku99E+oN0L5b0ydpwTWxIIGVFEaLbDFi6eFBod
         smUPnqPmUGx45G72YhXd1TFBDz9eXzpRclYkGuj+BuAZbyzns98NBxjhilibJg6lSJq8
         gOWw==
X-Gm-Message-State: AOAM531snWyDu6RINtaPvpFcpGhQqR7kqxcoD9KOE7frbjMXxYvfqyF3
	fqezxr9Zvc030dlSPbVzbmsi3m9dwthH
X-Google-Smtp-Source: ABdhPJyQkrGDQcm94s0dBnXDu2cTZ4aJxPIDfwFRlhVAC4AaXJpqeGtHAELu4BVxlUkdeohGgoS5gpBccD0I
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:10:ee29:8b32:75bc:44ec])
 (user=tzungbi job=sendgmr) by 2002:a25:2086:: with SMTP id
 g128mr623442ybg.759.1644383497254; Tue, 08 Feb 2022 21:11:37 -0800 (PST)
Date: Wed,  9 Feb 2022 13:11:30 +0800
Message-Id: <20220209051130.386175-1-tzungbi@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
Subject: [RESEND PATCH v2] platform/chrome: cros_ec_debugfs: detach log reader
 wq from devm
From: Tzung-Bi Shih <tzungbi@google.com>
To: bleung@chromium.org, groeck@chromium.org
Cc: chrome-platform@lists.linux.dev, tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"

Debugfs console_log uses devm memory (e.g. debug_info in
cros_ec_console_log_poll()).  However, lifecycles of device and debugfs
are independent.  An use-after-free issue is observed if userland
program operates the debugfs after the memory has been freed.

The call trace:
 do_raw_spin_lock
 _raw_spin_lock_irqsave
 remove_wait_queue
 ep_unregister_pollwait
 ep_remove
 do_epoll_ctl

A Python example to reproduce the issue:
... import select
... p = select.epoll()
... f = open('/sys/kernel/debug/cros_scp/console_log')
... p.register(f, select.POLLIN)
... p.poll(1)
[(4, 1)]                    # 4=fd, 1=select.POLLIN

[ shutdown cros_scp at the point ]

... p.poll(1)
[(4, 16)]                   # 4=fd, 16=select.POLLHUP
... p.unregister(f)

An use-after-free issue raises here.  It called epoll_ctl with
EPOLL_CTL_DEL which in turn to use the workqueue in the devm (i.e.
log_wq).

Detaches log reader's workqueue from devm to make sure it is persistent
even if the device has been removed.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
As for 2 other related cases I could image:

Case 1. userland program opens the debugfs after the device has been removed

ENOENT.  cros_ec_debugfs_remove() calls debugfs_remove_recursive().

Case 2. userland program is reading when the device is removing

If the userland program is waiting in cros_ec_console_log_read(), the device
removal will wait for it.

See the calling stack for the case:
 wait_for_completion
 __debugfs_file_removed
 remove_one
 simple_recursive_removal
 debugfs_remove
 cros_ec_debugfs_remove
 platform_drv_remove
 device_release_driver_internal
 device_release_driver
 bus_remove_device
 device_del
 platform_device_del
 platform_device_unregister

Changes from v1:
- rebase to next-20211029.
- change the commit messages.

 drivers/platform/chrome/cros_ec_debugfs.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_debugfs.c b/drivers/platform/chrome/cros_ec_debugfs.c
index 272c89837d74..0dbceee87a4b 100644
--- a/drivers/platform/chrome/cros_ec_debugfs.c
+++ b/drivers/platform/chrome/cros_ec_debugfs.c
@@ -25,6 +25,9 @@
 
 #define CIRC_ADD(idx, size, value)	(((idx) + (value)) & ((size) - 1))
 
+/* waitqueue for log readers */
+static DECLARE_WAIT_QUEUE_HEAD(cros_ec_debugfs_log_wq);
+
 /**
  * struct cros_ec_debugfs - EC debugging information.
  *
@@ -33,7 +36,6 @@
  * @log_buffer: circular buffer for console log information
  * @read_msg: preallocated EC command and buffer to read console log
  * @log_mutex: mutex to protect circular buffer
- * @log_wq: waitqueue for log readers
  * @log_poll_work: recurring task to poll EC for new console log data
  * @panicinfo_blob: panicinfo debugfs blob
  */
@@ -44,7 +46,6 @@ struct cros_ec_debugfs {
 	struct circ_buf log_buffer;
 	struct cros_ec_command *read_msg;
 	struct mutex log_mutex;
-	wait_queue_head_t log_wq;
 	struct delayed_work log_poll_work;
 	/* EC panicinfo */
 	struct debugfs_blob_wrapper panicinfo_blob;
@@ -107,7 +108,7 @@ static void cros_ec_console_log_work(struct work_struct *__work)
 			buf_space--;
 		}
 
-		wake_up(&debug_info->log_wq);
+		wake_up(&cros_ec_debugfs_log_wq);
 	}
 
 	mutex_unlock(&debug_info->log_mutex);
@@ -141,7 +142,7 @@ static ssize_t cros_ec_console_log_read(struct file *file, char __user *buf,
 
 		mutex_unlock(&debug_info->log_mutex);
 
-		ret = wait_event_interruptible(debug_info->log_wq,
+		ret = wait_event_interruptible(cros_ec_debugfs_log_wq,
 					CIRC_CNT(cb->head, cb->tail, LOG_SIZE));
 		if (ret < 0)
 			return ret;
@@ -173,7 +174,7 @@ static __poll_t cros_ec_console_log_poll(struct file *file,
 	struct cros_ec_debugfs *debug_info = file->private_data;
 	__poll_t mask = 0;
 
-	poll_wait(file, &debug_info->log_wq, wait);
+	poll_wait(file, &cros_ec_debugfs_log_wq, wait);
 
 	mutex_lock(&debug_info->log_mutex);
 	if (CIRC_CNT(debug_info->log_buffer.head,
@@ -377,7 +378,6 @@ static int cros_ec_create_console_log(struct cros_ec_debugfs *debug_info)
 	debug_info->log_buffer.tail = 0;
 
 	mutex_init(&debug_info->log_mutex);
-	init_waitqueue_head(&debug_info->log_wq);
 
 	debugfs_create_file("console_log", S_IFREG | 0444, debug_info->dir,
 			    debug_info, &cros_ec_console_log_fops);
-- 
2.35.0.263.gb82422642f-goog

