Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688B134BA50
	for <chrome-platform@lists.linux.dev>; Tue,  7 Oct 2025 00:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759797648; cv=none; b=ufr4++9hjcYHhOSZpLLZ2+czJOwSm7r/6WGxpTGdLFoqareBaQbh32mtD0VGA4kv8VmtmIj+gf5jy8O+wMmMcF7rd4dlYtwVqf2JYhUfZRiSHdkwrG20ZlBCoLZso9O7IUyrZip6FeKV2b/7LyA0TMga0LMmuKj2zfkuqxwOIqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759797648; c=relaxed/simple;
	bh=GzUSOSJZ+eDMzzz+ixvlJiOEN2cRY2aCg4gyiQyGc+8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=HSs9m3vsNC2fBrcoWOc8DV2ynab6UVzTGFdt4E29Hx3BBFlDGSEGBeaLNjqcpcuIgIktdWj/1e+N0f4Wx1lyAXMHWu9aTK594rxNp9Z7AqyypzyeBrADuG30h7NseNk8EJ8Hh6m08EGNZTliHWKi74jckL/PT2/ZKP0V1fgPh/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KuF93YWD; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KuF93YWD"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-272ed8c106eso34035765ad.2
        for <chrome-platform@lists.linux.dev>; Mon, 06 Oct 2025 17:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759797647; x=1760402447; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=W/DQArMjl2yBGMSdiHTTS+HBsWvNwcwKM6KZuhbPH/k=;
        b=KuF93YWD7Ag5aWw9ZE0B0igAmGQ4j0ElGDVsERg6MOwoVaHVkcn2GM60aor9NnKgo9
         20DPerGKJy5Y/1PtoRpGU7BdUDs3TsswImmXS9oeURHzdLit3e+zd68WeQP8+7SMw66s
         7g62VmM+KgnwneDj/gCBsF+9NxJvX9LVtDG6NtRYS7y+tsOswPnlAgssZXCHcckSS/ul
         LsddsLAYby2zHGbkgX/vwuKZ/W3VkDcixGIKcIOP4sP1+Li+7i1FbN9tnV+AdZhVoqkv
         VWj12RKbvQIRg7VF0uC3+D8mov5IafQjSwkUDpTu2ahuNtXbxdqiwXRFhzYZwmECDS2u
         tRkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759797647; x=1760402447;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W/DQArMjl2yBGMSdiHTTS+HBsWvNwcwKM6KZuhbPH/k=;
        b=vJ74VM1fe4oHud/tpMq73QTx7X63QMVQ12zbRwvk3R7ceGSCSsP+FjkZiIQIYqcOK0
         b1xqNCdenCYwUb3wIF6Qx4j8PfUKgZLc7NpqXj+Li+LmcQz3xOrtBPnYnNwS90qfeqbh
         3EujzUTcVf9urg1JJEfDOjYXxzlDxKOtT/Lr3c/sE0VQSnKpjJ4XAh2gVyiWbWnsngUo
         Flm9LFnZtA4sxi/kFh7d/m6338tZE/zZxC6rL/ro9kGY9gD5zE1SMWJskEcZvm4/BLMT
         GaBoMNtW90m6S+gYmrESft6YgEoS1MYXSH+0x3PmyG5T3n8VJgKC2SHxkW+JH0gM+M7E
         tUHw==
X-Forwarded-Encrypted: i=1; AJvYcCWCNrSw8kQCV1ikmcN7GM7fk0IwxZg6bmSP1CEflDcqMjK6Pf1DDBQQflH8YKIY61HEG3QFTvzNQB79yzKy1D8=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywx5qH0NropxJjBnxlFYJt+ynwuFy1p2ifrvkTKXFB8klKUDc6w
	3WbDF/HVvQcezB/XG7seUxQrKefA9PsIy/eGMzzKfg8Ag8C82TE0d/BpNPGkPw+yUodjxy6k2Q1
	5Xz6bXw==
X-Google-Smtp-Source: AGHT+IEY1y9c3Okn3yYddyarlZ6Ym/i6T63/pjjdt4P4J9z2U7i5GwzQfVHKsVapqjsTXkVksPfyo4YHfT4=
X-Received: from plhy5.prod.google.com ([2002:a17:902:d645:b0:264:d7d1:2748])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ea0d:b0:267:ba53:8bd3
 with SMTP id d9443c01a7336-28e9a61a74amr212561785ad.28.1759797646756; Mon, 06
 Oct 2025 17:40:46 -0700 (PDT)
Date: Tue,  7 Oct 2025 00:40:43 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251007004043.4109957-1-jthies@google.com>
Subject: [PATCH v2] platform/chrome: cros_usbpd_notify: defer probe when
 parent EC driver isn't ready
From: Jameson Thies <jthies@google.com>
To: akuchynski@chromium.org, bleung@chromium.org, abhishekpandit@chromium.org, 
	tzungbi@kernel.org
Cc: jthies@google.com, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The cros-usbpd-notify-acpi probe currently does not exit when it fails
to get a pointer to the ChromeOS EC device. It is expected behavior on
older devices, where GOOG0004 is not a parent of GOOG0003.

Update the cros-usbpd-notify-acpi probe to check for a GOOG0004 parent
fwnode. If the device has correct device hierarchy and fails to get an
EC device pointer, defer the probe function.

Signed-off-by: Jameson Thies <jthies@google.com>
---
 drivers/platform/chrome/cros_usbpd_notify.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_usbpd_notify.c b/drivers/platform/chrome/cros_usbpd_notify.c
index 313d2bcd577b..c90174360004 100644
--- a/drivers/platform/chrome/cros_usbpd_notify.c
+++ b/drivers/platform/chrome/cros_usbpd_notify.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/fwnode.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_data/cros_ec_proto.h>
@@ -15,6 +16,7 @@
 #define DRV_NAME "cros-usbpd-notify"
 #define DRV_NAME_PLAT_ACPI "cros-usbpd-notify-acpi"
 #define ACPI_DRV_NAME "GOOG0003"
+#define CREC_DRV_NAME "GOOG0004"
 
 static BLOCKING_NOTIFIER_HEAD(cros_usbpd_notifier_list);
 
@@ -98,8 +100,9 @@ static int cros_usbpd_notify_probe_acpi(struct platform_device *pdev)
 {
 	struct cros_usbpd_notify_data *pdnotify;
 	struct device *dev = &pdev->dev;
-	struct acpi_device *adev;
+	struct acpi_device *adev, *parent_adev;
 	struct cros_ec_device *ec_dev;
+	struct fwnode_handle *parent_fwnode;
 	acpi_status status;
 
 	adev = ACPI_COMPANION(dev);
@@ -114,8 +117,18 @@ static int cros_usbpd_notify_probe_acpi(struct platform_device *pdev)
 		/*
 		 * We continue even for older devices which don't have the
 		 * correct device heirarchy, namely, GOOG0003 is a child
-		 * of GOOG0004.
+		 * of GOOG0004. If GOOG0003 is a child of GOOG0004 and we
+		 * can't get a pointer to the Chrome EC device, defer the
+		 * probe function.
 		 */
+		parent_fwnode = fwnode_get_parent(dev->fwnode);
+		if (parent_fwnode) {
+			parent_adev = to_acpi_device_node(parent_fwnode);
+			if (parent_adev &&
+			    acpi_dev_hid_match(parent_adev, CREC_DRV_NAME)) {
+				return -EPROBE_DEFER;
+			}
+		}
 		dev_warn(dev, "Couldn't get Chrome EC device pointer.\n");
 	}
 

base-commit: 48633acccf38d706d7b368400647bb9db9caf1ae
-- 
2.51.0.618.g983fd99d29-goog

