Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF6B7F
	for <chrome-platform@lists.linux.dev>; Wed,  4 Jan 2023 01:15:29 +0000 (UTC)
Received: by mail-pj1-f74.google.com with SMTP id o36-20020a17090a0a2700b00226b4e9895aso99651pjo.8
        for <chrome-platform@lists.linux.dev>; Tue, 03 Jan 2023 17:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mtD8husdIdX8frEf87nd1VCmyju2z3AAnwArL0f2tyQ=;
        b=Q7S++mu/KIn18rahpCG9MwKvaZ9uHew8s0cbLbJbebMmMd9u9iEwBVWMh9l5vquXUg
         q0ttNr9bvEJEXMhsqmtkrwa+z5iymltBuj6AK/T40tt4kZmAh3FRgcq11HtXJ1u5shN1
         V1xlrJAHdDjnP303txqESGoiwuXpklvksk9UIIcM6ZRRW6sOWyAmFs2T1dhR7+Sk5YcH
         VzKmX36TtSXCbOnhEvbObgXsmDlpu6teqHVNTbF8tMKcoEMGx+DWuh5xvrQAvWXg0Kr/
         2OQGkDDO0nR6F2beZU32KKPuvEPaU0lpshckOUNnlOw/X1A7bUI1Sg54Xst0JGIwHumI
         53xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mtD8husdIdX8frEf87nd1VCmyju2z3AAnwArL0f2tyQ=;
        b=Bv7S4gL8wsrRtzk7ctpiPZGJXnOemetbTR2D6oWVT2bt42/344u73kqoP1Qb+Va5tX
         22eG68D/UcwGPUmH2MGDwAMg83qNI3mxQS6OIai5jcSVb0/Jk3qqCPu69V9TyoOUnSLi
         kvxrWNi6ZzZ3AixhJB9eXaaZu3AYuGsFQIRomNHV2TiWvY9kQnclJYwBABUKPlxI2krp
         hu4YR16nIpCBPK/AL0O0Grw6YR01kEfbaLMAGxF+hs6p1gQPVaXg1rI3qgzWK+Mluw95
         +2O1F9BUHLrtO4HcN1MXF4L3Mww72wPZOwqFqn0W6UgSL93MP8fJqgew/8Iv3kje0+Tu
         AU+w==
X-Gm-Message-State: AFqh2kof4ny3tNTDqMse7Jh/Z2cThV2DRlvaBQyncXX+90AQXuhig603
	JQRx+gVXPgyAXoYvbHx6by/XyhQNg0anJ+U=
X-Google-Smtp-Source: AMrXdXuwLpGlApYoxwzl8NZqS+fhRZdhxTeBTrJkIe/NFknBjsLe50Lyfk6qQwpyi4OT4ignAqtCIQqdWqAZ+co=
X-Received: from robbarnes3.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:6451])
 (user=robbarnes job=sendgmr) by 2002:a17:90a:e586:b0:221:684a:d076 with SMTP
 id g6-20020a17090ae58600b00221684ad076mr4131093pjz.4.1672794928809; Tue, 03
 Jan 2023 17:15:28 -0800 (PST)
Date: Wed,  4 Jan 2023 01:15:23 +0000
In-Reply-To: <20230104011524.369764-1-robbarnes@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230104011524.369764-1-robbarnes@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230104011524.369764-2-robbarnes@google.com>
Subject: [PATCH v3 1/2] platform/chrome: cros_ec: Poll EC log on EC panic
From: Rob Barnes <robbarnes@google.com>
To: groeck@chromium.org, pmalani@chromium.org
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	dtor@chromium.org, Rob Barnes <robbarnes@google.com>
Content-Type: text/plain; charset="UTF-8"

Add handler for CrOS EC panic events. When a panic is reported,
immediately poll for EC log.

This should result in the log leading to the EC panic being
preserved.

ACPI_NOTIFY_CROS_EC_PANIC is defined in coreboot at
https://review.coreboot.org/plugins/gitiles/coreboot/+/refs/heads/master/src/ec/google/chromeec/acpi/ec.asl

Signed-off-by: Rob Barnes <robbarnes@google.com>
---

Changelog since v1:
- Split into two patches
- Moved panic handle before mkbp loop
- Switched to dev_emerg message

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

