Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B6C1990C
	for <chrome-platform@lists.linux.dev>; Tue,  9 May 2023 23:19:22 +0000 (UTC)
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-1ac7c726067so30067215ad.0
        for <chrome-platform@lists.linux.dev>; Tue, 09 May 2023 16:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683674362; x=1686266362;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8n2Zrv8T6PmrpudUfUCDK4SfqRN+0y2bpFhBXTU3jzY=;
        b=f49JMDtJ9S+O7jM3S3kayf08PCz9pHAnZMBjwlzKGNJK5RRhZtkQnh9WDXE83taTZG
         i0PoTcRck4aZBhpLm+hYDNHosCpISCg8PvDHw1W4uC1q31Hz0fMl1GDl3KWPx3FzcX41
         jYqiKU/IEO++p1DhomnsIDaiAvBNaUCHoiG701077Y0uhmSCKQjVEr/9o4bBAqCkIFt/
         PmuuayKMA+gEa9sjqIJlyNRCFNwlhg6oV6kStAz0BkraHYLXOqV4H3YSDk5jY6BAHwL5
         5Cb+lSJf9u/r4kJl8RhbX5Lr2y1H5uEFnRoRUVE8qdRRomTl4JH/OFOdNIMvsv1ZZlBi
         j8qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683674362; x=1686266362;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8n2Zrv8T6PmrpudUfUCDK4SfqRN+0y2bpFhBXTU3jzY=;
        b=gKnmIcXBMRU3ioawUIW3kMOM9nMsLUUwnh2wWiDiV144gvkec4kQLaHrYFooriwWXl
         yo8BXGzFfbZUwEAXLHhczGTLZbPKLygQEu8GzCIjq72/oH+roOOTAFvwA4LVewVJhAVd
         lNZwgIQpRJSmbnlq9PFCmlVyoQu9Yi3MbgnPIsoUHj9aX8HXBh/32OmqIXDIXOBoJPiR
         kebVrpeilGhycgDpQFAVeuGM7JP47noDkcEF7nw8zwAKqeVnZvcr5Sz0nhuRjZnJVnmm
         beZMwToadYy0vrErhs/3h75YCs5NxnZfJ7ceMJ3tfjiM+USsdOwu0m/nRrzcEZz+vYNq
         sXrA==
X-Gm-Message-State: AC+VfDwFlfFPcx4VpgDT38/S+MEqI1eefzFOcOuMhYxLIplqjBKvu7ZZ
	/eHUFFPCghtKnfzEIBMZ1SeFQphW8ZsjBwJfkQT0EjPXklN5E8/tYLcQRU6uDv/WLABRG88/d4d
	ZGDGfgKdlNAje57v4mxs+hxxxecCgWaoIO6LQyqWMhmElPPcJlafBw6vS782KW45GKYMUl0Uu1l
	LsXbN/Ew==
X-Google-Smtp-Source: ACHHUZ4OfgQaHTW73zzSrE8EglWfmmGfLBSikXBSDCohKzU2WOZ/TO/r40pgp3mGgp/kv9lHaEnKMnnGhsW+K8o=
X-Received: from robbarnes3.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:6451])
 (user=robbarnes job=sendgmr) by 2002:a17:902:b583:b0:1a4:f282:91c7 with SMTP
 id a3-20020a170902b58300b001a4f28291c7mr5647277pls.6.1683674362219; Tue, 09
 May 2023 16:19:22 -0700 (PDT)
Date: Tue,  9 May 2023 23:19:06 +0000
In-Reply-To: <CACeCKafE3c+ie7_hHQnKpcRqV_n34oL3O3JfUNXoBUDTdTmQow@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <CACeCKafE3c+ie7_hHQnKpcRqV_n34oL3O3JfUNXoBUDTdTmQow@mail.gmail.com>
X-Mailer: git-send-email 2.40.1.521.gf1e218fcd8-goog
Message-ID: <20230509231906.3118230-1-robbarnes@google.com>
Subject: [PATCH v3] platform/chrome: cros_ec: Report EC panic as uevent
From: Rob Barnes <robbarnes@google.com>
To: chrome-platform@lists.linux.dev
Cc: dnojiri@chromium.org, tzungbi@kernel.org, pmalani@chromium.org, 
	Rob Barnes <robbarnes@google.com>
Content-Type: text/plain; charset="UTF-8"

iCreate a uevent when an EC panic is detected. This will allow udev rules
to trigger when a panic occurs. E.g. a udev rule could be added to
capture an EC coredump. This approach avoids the need to stuff all the
processing into the driver.

Signed-off-by: Rob Barnes <robbarnes@google.com>
Reviewed-by: Prashant Malani <pmalani@chromium.org>

---
Changlog since v2:
 - Move variable declaration to top of function

Changlog since v1:
 - Inline uevent call

 drivers/platform/chrome/cros_ec_lpc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index b399f7cbf17be..c6920df1e95dd 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -16,6 +16,7 @@
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/interrupt.h>
+#include <linux/kobject.h>
 #include <linux/module.h>
 #include <linux/platform_data/cros_ec_commands.h>
 #include <linux/platform_data/cros_ec_proto.h>
@@ -315,6 +316,7 @@ static int cros_ec_lpc_readmem(struct cros_ec_device *ec, unsigned int offset,
 
 static void cros_ec_lpc_acpi_notify(acpi_handle device, u32 value, void *data)
 {
+	static const char *env[] = { "ERROR=PANIC", NULL };
 	struct cros_ec_device *ec_dev = data;
 	bool ec_has_more_events;
 	int ret;
@@ -324,6 +326,7 @@ static void cros_ec_lpc_acpi_notify(acpi_handle device, u32 value, void *data)
 	if (value == ACPI_NOTIFY_CROS_EC_PANIC) {
 		dev_emerg(ec_dev->dev, "CrOS EC Panic Reported. Shutdown is imminent!");
 		blocking_notifier_call_chain(&ec_dev->panic_notifier, 0, ec_dev);
+		kobject_uevent_env(&ec_dev->dev->kobj, KOBJ_CHANGE, (char **)env);
 		/* Begin orderly shutdown. Force shutdown after 1 second. */
 		hw_protection_shutdown("CrOS EC Panic", 1000);
 		/* Do not query for other events after a panic is reported */
-- 
2.39.2

