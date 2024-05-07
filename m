Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B85168AF5
	for <chrome-platform@lists.linux.dev>; Tue,  7 May 2024 15:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715097499; cv=none; b=sVIkWBFue6W2fiOBPD2n7JUvG7m3oL/LO8dUl8HSMm0APy7gJgcbi6rhSIzDCntDSYQs3L2vdXUBy89sG+dbvXPsMf250gtOkI0w+CA3RKznKAbA8p1F3q7q4upHY1oXL0Bd2jVWYA7iOiPi9d9zrmXrdN4TYrg0JPdh/DIAG5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715097499; c=relaxed/simple;
	bh=VKTs3irmcw82siGH33HOQaqkmAgNt7MrpxmtEuPMMZU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=STgSSw71lJyp4afQoG1jVzXt7W69SI1LgQiPFA91LHhlU2/kDLKpfDCCdLfd/bmITfTVZrVjUVfac7m+ghZ6gMB+qi8jQh/cYBdVGepa4VNWCioArnB53JkqGVlBs52so8msXmNeb9rgKZvDdUAa9dOcIZ5xyIIe/woK1cwgIi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--robbarnes.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=crmYIjG2; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--robbarnes.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="crmYIjG2"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dc6b26783b4so4303032276.0
        for <chrome-platform@lists.linux.dev>; Tue, 07 May 2024 08:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715097493; x=1715702293; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NezDOu+L0Xs/ccnTKUGf+82Wr0VYnf4nPq+xzhwUlDg=;
        b=crmYIjG2vdsN7ghoU551jHmCavigFQ7rrXBTvmrw/56mIcHiiLLAOqUmzcFdKXzaIv
         OTPALAPGtwmpURbXW1yCD5nRrkIdVYd8HzW+wdRE8bGVtfTcdaaRiAcbhbeZFHCUP3GX
         wMTmRJIRyKhsZTOeFTx8rNkuCc1X81cVH4bubIyuVxi2qMdoJEydd5e5dm6ODzfNf6dZ
         7Qn5/7Fc2V4PQ/wrkzBYgbjEUNqX9EkkLKVOiatj3O/hzlN+ErMboBLnt65ohYpROEJb
         G9QYIquSOEd60yuneN+cmZPqvyC9Pr5xMgcTAQS5Q43sF4roW4jp1UEtcveRSb1YG3vq
         7VIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715097493; x=1715702293;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NezDOu+L0Xs/ccnTKUGf+82Wr0VYnf4nPq+xzhwUlDg=;
        b=UxXE6239z7cuIFPtlaOuXe4BHJfPRV2xNiFOlujUDxLpxjcM6eg4u9wuayvpV3tU66
         63Vqb74myzxzpBAViCSe7sjcMxGVBFHS3Udbg75t9iFgVURgAZZG1mnfu428iorhTXlw
         StQFtiRoYyjUu6ss4mvw3PvLbEYay8ZF5L/CX6dHgdetAj+TXSg6j/n+NdYSBHpmu3vb
         x+clnq/2UqrwQiTLFFTuzZDxnd0smRZe+QD8Yk2iMdncVTnOMN8dULmKqMkIvH8ENYb+
         PiIl8/fc93U/yO1CkOfujpEj3Xumavv+Rq8Br/dN7SIkDOj4EbayUUgFljBBF+UKuJ3v
         gRpA==
X-Gm-Message-State: AOJu0YzpCQ/5Iv427FQIQvMFkyiYjADhw/bYQN57nxh0UIASidXQV4O7
	XNBsIxe5nNF6jI3s68ILGCF4XeTSGLyNeoOyAwuJotJO7/gCfYgHkriy2bA0P2pfQZQPAo3MPS5
	YVaGkqHKVtUwk4F90PrUTRzpJSTMchIty+tL52ODUVB1AkBogr+oPn4aMGjvqsxMbaOG5jcTXOS
	daHdIEs+SXVWPojka6V3b8AarmmXcbImAfRyqNOOtqWYe06BTGhZgUIpKZsfFl
X-Google-Smtp-Source: AGHT+IHHQvhs6Xx6YDBgJbvwmxK536McGv8344wji+VqBx6XWkaLBUMp2bBoJC91oNBMByZr/X9gijMUkS4oke4=
X-Received: from robbarnes3.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:6451])
 (user=robbarnes job=sendgmr) by 2002:a05:6902:1884:b0:dda:d7cf:5c2c with SMTP
 id 3f1490d57ef6-debb9da5e17mr134276.13.1715097492168; Tue, 07 May 2024
 08:58:12 -0700 (PDT)
Date: Tue,  7 May 2024 15:58:09 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
Message-ID: <20240507155809.525701-1-robbarnes@google.com>
Subject: [PATCH] drivers/cros_ec: Make log polling period a parameter
From: Rob Barnes <robbarnes@google.com>
To: chrome-platform@lists.linux.dev
Cc: tzungbi@kernel.org, gwendal@chromium.org, groweck@chromium.org, 
	Rob Barnes <robbarnes@google.com>
Content-Type: text/plain; charset="UTF-8"

Make EC log polling period a module parameter. This allows the polling
period to be set via the kernel command line. Keeping the default at
the current 10 second period. The optimal polling period will differ by
board.

Signed-off-by: Rob Barnes <robbarnes@google.com>
---
 drivers/platform/chrome/cros_ec_debugfs.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_debugfs.c b/drivers/platform/chrome/cros_ec_debugfs.c
index 6bf6f0e7b597..95101b0d5227 100644
--- a/drivers/platform/chrome/cros_ec_debugfs.c
+++ b/drivers/platform/chrome/cros_ec_debugfs.c
@@ -25,6 +25,10 @@
 
 #define CIRC_ADD(idx, size, value)	(((idx) + (value)) & ((size) - 1))
 
+static unsigned int log_poll_period_ms = LOG_POLL_SEC * MSEC_PER_SEC;
+module_param(log_poll_period_ms, uint, 0644);
+MODULE_PARM_DESC(log_poll_period_ms, "EC log polling period(ms)");
+
 /* waitqueue for log readers */
 static DECLARE_WAIT_QUEUE_HEAD(cros_ec_debugfs_log_wq);
 
@@ -56,7 +60,7 @@ struct cros_ec_debugfs {
 
 /*
  * We need to make sure that the EC log buffer on the UART is large enough,
- * so that it is unlikely enough to overlow within LOG_POLL_SEC.
+ * so that it is unlikely enough to overlow within log_poll_period_ms.
  */
 static void cros_ec_console_log_work(struct work_struct *__work)
 {
@@ -118,7 +122,7 @@ static void cros_ec_console_log_work(struct work_struct *__work)
 
 resched:
 	schedule_delayed_work(&debug_info->log_poll_work,
-			      msecs_to_jiffies(LOG_POLL_SEC * 1000));
+			      msecs_to_jiffies(log_poll_period_ms));
 }
 
 static int cros_ec_console_log_open(struct inode *inode, struct file *file)
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

