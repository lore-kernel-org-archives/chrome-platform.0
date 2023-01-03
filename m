Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C758F7C
	for <chrome-platform@lists.linux.dev>; Tue,  3 Jan 2023 22:52:11 +0000 (UTC)
Received: by mail-pg1-f201.google.com with SMTP id r22-20020a63ce56000000b00478f1cfb0fbso14367876pgi.0
        for <chrome-platform@lists.linux.dev>; Tue, 03 Jan 2023 14:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gCRt1jXA3EFNeh3Ef3paeCdrspg7DO2l/E998ZQOZQ0=;
        b=fd7bqylczYCe+HaqGdqTueg8+CKFFdVV3pnZnEo5qhomKC4EhQuMTLru5Ssq9c840C
         7fpAALTnCqjRJ90OikK3OSW4iyi6TJA2vLin2OqWzWzefxBwJL4d/d4T3z8phlFQbgwq
         43ZpZPZo6Go48PmS77mJ5YGCpnbxAUx9WgQF+W6+9esWAt2rGyIZjH3djKMquq4R7gcM
         Lx7SZl3PkCNIQKnkZYUugxxeXBgf0Fhg0rzINpJu/R7aH8kVfyNaeR5OvmFje63filvH
         LC5sdgIJASiazAlPU/CWbD+wm3A3u71FOEiEXEZjx0zH2UxHVt+01w2cgu+EASwDLS88
         92Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gCRt1jXA3EFNeh3Ef3paeCdrspg7DO2l/E998ZQOZQ0=;
        b=zFB6J28Ne5yajWJ9UREJr1mJEutEVb1F+SkradgF3H53NAlDFQDkemg0ugdTSLtlmS
         vp0e86mEguVnP87z3OroiP7+qDmtiD0CNxkwydGiG3OyE2d7lzm6Che2CCy3KqGHsLzl
         vxxBuh71x4d56i48C5mfmDgYeDDcHC+Ovmt0+sbVUTcFw+hsAnjBFY/ULu8BSxMNYsv2
         6ZbJvUSeXJlkOHIR2jZiqtL13kyEeAylK7kHPJoZE4CR8flSre2GiCo+CUoIDeyLnawA
         DG8Mlxe+Ouiaq9DsrwZ6SbwmZUI0XiV9fbdeXQOz5ytC2ZPqSLU69EO7Nr+czF8nklwA
         +7Xw==
X-Gm-Message-State: AFqh2kq0U+WB5Op0HQKhj/fILPt6EBeyfXTUd/xxU3fYZZh7lVpSLObs
	iUgtjmQa/NGCwqhMU1X53uYYdYZzBteo1Ks=
X-Google-Smtp-Source: AMrXdXs6/XStqPC0Uky53YhBUNTm3dYUzkoI9+6Lecq6nyTUrQURo05/acr6qc7e0UGp/8DAy+MHMG9XgXDJgyU=
X-Received: from robbarnes3.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:6451])
 (user=robbarnes job=sendgmr) by 2002:a05:6a00:1a11:b0:582:8ea5:d052 with SMTP
 id g17-20020a056a001a1100b005828ea5d052mr426363pfv.32.1672786330678; Tue, 03
 Jan 2023 14:52:10 -0800 (PST)
Date: Tue,  3 Jan 2023 22:52:02 +0000
In-Reply-To: <20230103225204.346088-1-robbarnes@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <CACeCKafGg5=1MQQdCtXDm-3LE2VsixHPsUDngRwQXUvAwQ=u=Q@mail.gmail.com>
 <20230103225204.346088-1-robbarnes@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230103225204.346088-2-robbarnes@google.com>
Subject: [PATCH v2 1/2] platform/chrome: cros_ec: Poll EC log on EC panic
From: Rob Barnes <robbarnes@google.com>
To: groeck@chromium.org, pmalani@chromium.org
Cc: chrome-platform@lists.linux.dev, dtor@chromium.org, 
	Rob Barnes <robbarnes@google.com>
Content-Type: text/plain; charset="UTF-8"

Add handler for CrOS EC panic events. When a panic is reported,
immediately poll for EC log.

This should result in the log leading to the EC panic being
preserved.

ACPI_NOTIFY_CROS_EC_PANIC is defined in coreboot at
https://review.coreboot.org/plugins/gitiles/coreboot/+/refs/heads/master/src/ec/google/chromeec/acpi/ec.asl

Change-Id: I622a5e99b8be922f5c1a8004a863cf94a63ac813
Signed-off-by: Rob Barnes <robbarnes@google.com>
---
 drivers/platform/chrome/cros_ec_debugfs.c   | 23 +++++++++++++++++++++
 drivers/platform/chrome/cros_ec_lpc.c       |  7 +++++++
 include/linux/platform_data/cros_ec_proto.h |  9 ++++++++
 3 files changed, 39 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_debugfs.c b/drivers/platform/chrome/cros_ec_debugfs.c
index 21d973fc6be2..34f7b46f8761 100644
--- a/drivers/platform/chrome/cros_ec_debugfs.c
+++ b/drivers/platform/chrome/cros_ec_debugfs.c
@@ -49,6 +49,7 @@ struct cros_ec_debugfs {
 	struct delayed_work log_poll_work;
 	/* EC panicinfo */
 	struct debugfs_blob_wrapper panicinfo_blob;
+	struct notifier_block notifier_panic;
 };
 
 /*
@@ -437,6 +438,22 @@ static int cros_ec_create_panicinfo(struct cros_ec_debugfs *debug_info)
 	return ret;
 }
 
+static int cros_ec_debugfs_panic_event(struct notifier_block *nb,
+				       unsigned long queued_during_suspend, void *_notify)
+{
+	struct cros_ec_debugfs *debug_info =
+		container_of(nb, struct cros_ec_debugfs, notifier_panic);
+
+	if (debug_info->log_buffer.buf) {
+		/* Force log poll work to run immediately */
+		mod_delayed_work(debug_info->log_poll_work.wq, &debug_info->log_poll_work, 0);
+		/* Block until log poll work finishes */
+		flush_delayed_work(&debug_info->log_poll_work);
+	}
+
+	return NOTIFY_DONE;
+}
+
 static int cros_ec_debugfs_probe(struct platform_device *pd)
 {
 	struct cros_ec_dev *ec = dev_get_drvdata(pd->dev.parent);
@@ -473,6 +490,12 @@ static int cros_ec_debugfs_probe(struct platform_device *pd)
 	debugfs_create_u16("suspend_timeout_ms", 0664, debug_info->dir,
 			   &ec->ec_dev->suspend_timeout_ms);
 
+	debug_info->notifier_panic.notifier_call = cros_ec_debugfs_panic_event;
+	ret = blocking_notifier_chain_register(&ec->ec_dev->panic_notifier,
+					       &debug_info->notifier_panic);
+	if (ret)
+		goto remove_debugfs;
+
 	ec->debug_info = debug_info;
 
 	dev_set_drvdata(&pd->dev, ec);
diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index 7fc8f82280ac..5738f1d25091 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -320,6 +320,13 @@ static void cros_ec_lpc_acpi_notify(acpi_handle device, u32 value, void *data)
 
 	ec_dev->last_event_time = cros_ec_get_time_ns();
 
+	if (value == ACPI_NOTIFY_CROS_EC_PANIC) {
+		dev_emerg(ec_dev->dev, "CrOS EC Panic Reported. Shutdown is imminent!");
+		blocking_notifier_call_chain(&ec_dev->panic_notifier, 0, ec_dev);
+		/* Do not query for other events after a panic is reported */
+		return;
+	}
+
 	if (ec_dev->mkbp_event_supported)
 		do {
 			ret = cros_ec_get_next_event(ec_dev, NULL,
diff --git a/include/linux/platform_data/cros_ec_proto.h b/include/linux/platform_data/cros_ec_proto.h
index e43107e0bee1..7fb2196f99b0 100644
--- a/include/linux/platform_data/cros_ec_proto.h
+++ b/include/linux/platform_data/cros_ec_proto.h
@@ -41,6 +41,13 @@
 #define EC_MAX_REQUEST_OVERHEAD		1
 #define EC_MAX_RESPONSE_OVERHEAD	32
 
+/*
+ * EC panic is not covered by the standard (0-F) ACPI notify values.
+ * Arbitrarily choosing B0 to notify ec panic, which is in the 84-BF
+ * device specific ACPI notify range.
+ */
+#define ACPI_NOTIFY_CROS_EC_PANIC 0xB0
+
 /*
  * Command interface between EC and AP, for LPC, I2C and SPI interfaces.
  */
@@ -176,6 +183,8 @@ struct cros_ec_device {
 	/* The platform devices used by the mfd driver */
 	struct platform_device *ec;
 	struct platform_device *pd;
+
+	struct blocking_notifier_head panic_notifier;
 };
 
 /**
-- 
2.39.0.314.g84b9a713c41-goog

