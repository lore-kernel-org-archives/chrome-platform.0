Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56543381AF9
	for <chrome-platform@lists.linux.dev>; Sat,  3 Oct 2026 20:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791060460; cv=none; b=ihjF6xkEuafqO5U99X8r2rGlP8NSkkQ4113u5ty5AMxXsSw7KjRPGIJoXw7zTm4XR00eACYL2vD3Z2GuvEFyv5o4NcuHQc717PzYKwnxlgHoyMHFuuuUWlRHLd98QcHxrTvCRvUVUx+GnixxwPWPTkccc/L7wBNi2c1JTbz6+UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791060460; c=relaxed/simple;
	bh=3waTcqu7WfSqnyy1qyZwokR9PDx0faALLxsyPG9SpJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cPSDRe8AOcHP1ymjsUSbtRwvoxUj4FojeuT91T8NmsLUs5VebuvAsA8+KZcTxQtpM3JWQqMZ3RRXbgRKXkAz5ya3suQY4bFYGuvav9D5xTEKzo9NVmJVWcf9z0yMin5bLADPv19PGbalM807B/N2w+dB2Rp0uCsIdhdCK5IFhNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iuZUhoG+; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iuZUhoG+"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3510f6f130bso386642eec.3
        for <chrome-platform@lists.linux.dev>; Sat, 03 Oct 2026 13:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791060458; x=1791665258; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LWI6jJflnF3Jznt6V7RyFKMPgWKtj7c0n940mijqVvA=;
        b=iuZUhoG+mR2D5B1NqcPVwczuyTCZTl5ocnG6ryZ0SPiLis+l8AoQjHHRc3xbiGJnBC
         LLLksn5YILsMDE4J9AQErQAvCJ4rggPaZSG4EElH4Uk2u1yzG66c2lRSa3ZcUe4c2lZr
         2MIEcIu5iAlRo77c9ZRUd4HX2oWad+f2DjxUAJIaK3FEFzHQFzf0RBhQh1cMPw8rWof9
         eetO5KS7JoglNIL2FjI1ZkwsnqqIHRt0Lx32js3VS0EXvzXo6ThNGUzOo2tlIUTYpLA3
         kTdHXw80agVRAV+KXk8WjP4MSZdQ18lqhg8YXbUGqn5NYNwzp7uihtPxRTX3rdVKFMrJ
         wnVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791060458; x=1791665258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LWI6jJflnF3Jznt6V7RyFKMPgWKtj7c0n940mijqVvA=;
        b=jRgReGBu5sUrq0BO/yBBTt+L6JM/KblXLeLIdV/YWH3Zr5bv8lyVCvYQxMqq3kVZhH
         zl4d6ygLCGBh/rU9dQ/GSTfewLLf7ExY7M9hPK1jGZow1yVrj1IEKGYKQJWqsfzPPOi+
         YK6+xfFAakOGWNtaj0CHKktVN9PJZyv7QSVcw2/lG8zq0PYn907jrhBTRn6+Q7eW98YR
         oe25Ms87y5cMKlWrBzLmdi0Gi/y3Gigh0UWMpLXYU7DmoVAhZWR/dQaAK9SP4eHLwL9X
         BnEwbIqok9tW37o7RK9tHM/nQSXlo281gtgZQiO+IVup3P/ES7cp5KHMxG22wZCggPfm
         PuLw==
X-Forwarded-Encrypted: i=1; AKwUvBz5hkQ+285Kxd2WSa11/GRgR1FkJzIVatKF5/vUa75IaxwdBz4BZcZRx8kSV7ihkl9KRFyT1o73Ds+MEe8G/0I=@lists.linux.dev
X-Gm-Message-State: AFq9FYIXQKa+mGO4zprzdXgnEN1e4nCwR8w8YaHK3f003SLuQrb+JHmX
	7RgG1NYqcwLCzRxyGA1HQprjTmXH6b1zZFEaRb4SoIYecXjladYqKeTR
X-Gm-Gg: AYBFou0N/HoCmiNaZVsmMGFTSGQStvEHsdXtQTkQRWxwlIJ4JBoa7hrYp1YVxtmKSw2
	jJgO5L1EQ7qMVKIMZ4UiC5y0aGNqJIaFurqVI8hi8T9uSmjTTFAVb4bmLLBDih+yIwbyK+0KBBN
	wnfptf22XG5KCkgu7NgVVslmy4ktlfgagEEtdsTOJHAXGLjRr7/5D0Rxac5h58VthWNVH9pyMTQ
	aRGuiH1Ma2ikAoHU/H7XC8DtnWNWJT5ZrqusxhFrMnzfGifIriel0xz+tyBBiNMl3zczoMufs1p
	23zgo4Ib+41Bvk/JHPGFoGNeiMoroJn9KShrnk7ECxkzotdW93/5/E3DsFabWypOLTzhRmnaka5
	hwgz7fJtUMDo0VdDXD2eZFsRipBQ4Pg4jLwoy4pZNgqSUcuMtIshn/ZlI7AQwY0ucxnkmtKW+vj
	XUn8NSmuqA4a/PfSBVZ91oYA02olM3EwAGrXkZ6eRgP7zgx+QQxJSOEPilC8LZuekvmQQu0Yy5G
	By9rIS/KIDxwlByVmxqe2jZSFKnqc4d4guWq1sRY/9afX11PrNplGaqnUDu6juAO9OIfQljN9qh
	GfM=
X-Received: by 2002:a05:7301:702:b0:33b:fc17:e786 with SMTP id 5a478bee46e88-34f150c35bamr6919058eec.16.1791060458241;
        Sat, 03 Oct 2026 13:47:38 -0700 (PDT)
Received: from eve ([2601:644:4300:43e6:fe7a:b82e:befa:cd4b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14fd4dd2sm19853100eec.20.2026.10.03.13.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 13:47:37 -0700 (PDT)
From: Sergey Tiraspolsky <stiraspo@gmail.com>
To: Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Jameson Thies <jthies@google.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sergey Tiraspolsky <stiraspo@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] platform/chrome: cros_usbpd_notify: Don't use a non-EC parent's drvdata
Date: Sat,  3 Oct 2026 13:46:23 -0700
Message-ID: <20261003204623.18124-1-stiraspo@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cros_usbpd_notify_probe_acpi() takes the parent's driver data as the
struct cros_ec_device to talk to. Only the Chrome EC (GOOG0004) stores
one there. On older devices without the updated device hierarchy,
GOOG0003 is a child of the ACPI EC (PNP0C09) instead, as on the 2017
Pixelbook (Eve), and the driver relied on the parent's driver data
being NULL to fall back to sending a 0 event.

Since commit db65a06d10b3 ("ACPI: EC: Convert the driver to a platform
one"), the ACPI EC's platform device stores its struct acpi_ec as driver
data, so on those devices the probe treats a struct acpi_ec as a struct
cros_ec_device. The "Couldn't get Chrome EC device pointer" warning is
no longer printed, and every USB PD notification, e.g. on resume or
charger plug, oopses:

  BUG: unable to handle page fault for address: ffffffff96103220
  Oops: Oops: 0002 [#1] SMP PTI
  Workqueue: kacpi_notify acpi_os_execute_deferred
  RIP: 0010:native_queued_spin_lock_slowpath+0x29d/0x330
  Call Trace:
   _raw_spin_lock_irqsave+0x59/0x80
   cros_ec_cmd_xfer+0x2a/0xf0 [cros_ec_proto]
   cros_ec_cmd_xfer_status+0x1a/0x90 [cros_ec_proto]
   cros_ec_cmd+0xb7/0x140 [cros_ec_proto]
   cros_usbpd_get_event_and_notify+0x42/0xc0 [cros_usbpd_notify]
   acpi_ev_notify_dispatch+0x4e/0x70

When it happens during resume, the machine stays on a black screen.

Only use the parent's driver data when the parent is GOOG0004, as the
probe already does when deciding whether to defer, and continue without
an EC device pointer otherwise.

The root cause was found from the oops logs, and this change and its
changelog were written, with the help of an AI coding assistant. I
reviewed both and tested the fix on the affected hardware.

Fixes: db65a06d10b3 ("ACPI: EC: Convert the driver to a platform one")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Sergey Tiraspolsky <stiraspo@gmail.com>
---

Notes:
    Tested on a 2017 Google Pixelbook (Eve), where GOOG0003 is a child of
    PNP0C09, on 7.2.5 (Arch-based distro kernel; none of its patches touch
    drivers/platform/chrome or drivers/acpi/ec.c), building this change as
    an out-of-tree module:
    
     - without the patch: four oopses with the trace above in the logs, one
       3 seconds after resume, and lid-close suspends that never resumed
     - with the patch: the probe prints "Couldn't get Chrome EC device
       pointer." again; a charger unplug/replug produced 9 USB PD
       notifications, all taking the "EC device inaccessible; sending 0
       event status" path; suspend with a charger unplug/replug while asleep
       resumed normally; no oopses
    
    Not tested: a device where GOOG0003 is a child of GOOG0004 (that path
    only moves into the if branch here, its logic is unchanged).

 drivers/platform/chrome/cros_usbpd_notify.c | 37 +++++++++++----------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/chrome/cros_usbpd_notify.c b/drivers/platform/chrome/cros_usbpd_notify.c
index 6f5eea4938..5657b93a6c 100644
--- a/drivers/platform/chrome/cros_usbpd_notify.c
+++ b/drivers/platform/chrome/cros_usbpd_notify.c
@@ -110,24 +110,25 @@ static int cros_usbpd_notify_probe_acpi(struct platform_device *pdev)
 	if (!pdnotify)
 		return -ENOMEM;
 
-	/* Get the EC device pointer needed to talk to the EC. */
-	ec_dev = dev_get_drvdata(dev->parent);
-	if (!ec_dev) {
-		/*
-		 * We continue even for older devices which don't have the
-		 * correct device hierarchy, namely, GOOG0003 is a child
-		 * of GOOG0004. If GOOG0003 is a child of GOOG0004 and we
-		 * can't get a pointer to the Chrome EC device, defer the
-		 * probe function.
-		 */
-		parent_fwnode = fwnode_get_parent(dev->fwnode);
-		if (parent_fwnode) {
-			parent_adev = to_acpi_device_node(parent_fwnode);
-			if (parent_adev &&
-			    acpi_dev_hid_match(parent_adev, CREC_DRV_NAME)) {
-				return -EPROBE_DEFER;
-			}
-		}
+	/*
+	 * Get the EC device pointer needed to talk to the EC. Only the Chrome
+	 * EC (GOOG0004) stores a struct cros_ec_device as its driver data, so
+	 * only use the parent's driver data when GOOG0003 is a child of
+	 * GOOG0004, and defer the probe until that driver has bound.
+	 *
+	 * We continue without the pointer for older devices which don't have
+	 * the correct device hierarchy. There GOOG0003 is a child of another
+	 * device, such as the ACPI EC (PNP0C09), whose driver data is not a
+	 * struct cros_ec_device.
+	 */
+	parent_fwnode = fwnode_get_parent(dev->fwnode);
+	parent_adev = to_acpi_device_node(parent_fwnode);
+	if (parent_adev && acpi_dev_hid_match(parent_adev, CREC_DRV_NAME)) {
+		ec_dev = dev_get_drvdata(dev->parent);
+		if (!ec_dev)
+			return -EPROBE_DEFER;
+	} else {
+		ec_dev = NULL;
 		dev_warn(dev, "Couldn't get Chrome EC device pointer.\n");
 	}
 
-- 
2.55.0

