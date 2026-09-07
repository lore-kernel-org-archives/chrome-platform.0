Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADBC428470
	for <chrome-platform@lists.linux.dev>; Mon,  7 Sep 2026 14:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788789660; cv=none; b=aYAx7sJe603bWda29kBcH9XcUbHAqKFpQl4ozktPA4ABdQRLADUmDKCx9UwnbdtJEHjrPW1BX1zNXm+FxBMsXdQfTRRnp9utZM5/pDy20jyFQGWo83li+k/yOCDLfKFIQ0Rzq42muh0Rfj98AO/y4ZO9vPZgTpmjg8LhLc65A+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788789660; c=relaxed/simple;
	bh=YAgyDv+00NlMfBI48daNj603uX3psSBnQCjEdKjLrPA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=t5iWYytpt5Zud4s0a1spjdAAMopDLV7zBH3iElU2yWRrQuyBf5mpRla70vcaVZ7iuCpiCdng7V27tjOErHAIcu4pjv7Xt1pyAt+PjXCmQ5/e8Arh1czLUd5w6ffXPHa1vAtfsxpg5eGQvZGEslHgmfsXiegZgtr7GfRXv4gX2Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=f0hwyLU5; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="f0hwyLU5"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d715f4a587so49917695ad.2
        for <chrome-platform@lists.linux.dev>; Mon, 07 Sep 2026 07:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1788789658; x=1789394458; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8jgbrYh5zlt6SCZ9hvN3S2HoSjS6tvqEiP9J6AFTYQc=;
        b=f0hwyLU5wZhF3FLtid5KA3EIlvahNDxGcosWGcVAWjCmVxiM1kbnVZ5aWhzpHqGI8V
         dkCn+vpnoDBlr1v+wmAgm2QPoWzNxzyPTK6tKps6yM51b9SBMSWOl6pQSuqxyORiIj65
         cnGX2RrT6oknJt0uk79wVlvHhYE9h52mimhPbWzG/KHhglYFUc2MsZ3frvTjgP9Bpcyd
         FjhbcPhb5C44+HV2lf6EJ28STvv5geUQGdGxjNdJr4DtSmQyA2ED0768vHwKZDDjXuow
         8iqazK8mrXIpu36SMCT18jQmVTT3UQO3Vo5SLlGA/if5E+oXAQUp/xWzyfZEnccggehx
         C2cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788789658; x=1789394458;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8jgbrYh5zlt6SCZ9hvN3S2HoSjS6tvqEiP9J6AFTYQc=;
        b=WEyM++gnbzS7a+A0Yr8xLrpVDOyeSjTHynHYIFVfYtp6PEnFS9MZKhwN6cFlpN1zlX
         hQ5331qiMjPGd7IKwMtBbbUHh0FWmJ1/GAynU72qsYgKzbCgYR2WdXBnVFEVw4YvcNHF
         Ex97nBWZNlnzENo4B3huGEwzXPWLB3nffrmwfRcKyndwN23DjgdviEDorXkrHrrQhAwd
         yQx5rZG+PFy7qZBcJXBbXPHcPzpG6EBkwoUmn7PAhIgBC+Xu8BahHx90ypNVpekm3moA
         zjed1TOJAOsnNRjob35AYHkG/OOA0/R6dsfSik/ZJXOpsJ0hjykxjsWnChtjUCo7Tw82
         dFiw==
X-Gm-Message-State: AFuF++mhY7K5gfVuKtVOg2wiV5UIpsgQkrCKVkwDTA1DmHSI3zFvP7C1
	LD3rjkB3Q0RXUa+AqjzpCtPen5Gv4m4Ck4ZHtOYdu9gSGwPy1MfxPPQSYRriiWAJT7shs0lnPOK
	gFkTa
X-Gm-Gg: AYBFou3TVai3B15PG+YLn6FeVk+L4nZXtZomL19s7SdBrv0/EaHrYxVzd/ufQy20BWk
	na7+axjQ7Cr/Q5322JBh8kN3ltRgInvDiBNEmaVwcPBKPOcq6Rja+eeQuK4Lu7KnVqDjRlpbKyZ
	N/Wbq2XxAImPAEazZIha4oBfo17kesl2EEZ5jme6rB/DUzE8ZvPVq3UeWQ7FDpE48mBKdN6EmfS
	3+oXOcoy8G0h+f8wSAr0wIqYe+C6sRHh9dLysGYdktVKWQ1n3f9/poRewg68p5DR5L/50+CDoC+
	+0KWUR5ZHbMhldU/R3EXiTudpKb3FLxuycJBtGYpJ/xnlzRuE0nLX8kZB/OKOgwXRTgX7O84bPG
	wjHZJGilHteHR4W46DgMT9HYZ+HlMj6No5Z/D1ofc1hANuwRCZ6S2axRezHXrsS90D0M1v1nc69
	PqfkjiyRMZA5S4hSqbbl4nJQkBt6qiRt94Bf+buPnk7dlhtYhp/NGvs1yVHGqecXWWkizOpVTTA
	Q2HUGo=
X-Received: by 2002:a17:90b:5344:b0:38e:4f41:83df with SMTP id 98e67ed59e1d1-39b261e0f14mr35201195a91.15.1788789657257;
        Mon, 07 Sep 2026 07:00:57 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:9f74:2a4b:1c38:e2d8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-336c2571039sm10083615eec.25.2026.09.07.07.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 07:00:56 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Mon, 07 Sep 2026 15:00:45 +0100
Subject: [PATCH v2] firmware: coreboot: use named initializers for
 acpi_device_id
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-acpi-firmware-v2-1-e0b6d40823d1@thegoodpenguin.co.uk>
X-B4-Tracking: v=1; b=H4sIAIzDnmoC/3WNQQ6CMBBFr0JmbUlLUKgr72FYjO0Ao7ElLaCG9
 O4Crl2+5P33F4gUmCKcswUCzRzZuxWKQwamR9eRYLsyFLI4SS1LgWZg0XJ4vjCQOBrdWlUjEkp
 YN0Oglt9779r8OE63O5lxi2xGz3H04bMfzmrz/rVnJZSoqLQVSq10TZexp857O5DrJna58fn0g
 Cal9AV/witwxwAAAA==
X-Change-ID: 20260904-acpi-firmware-5c9fd18aaea0
To: Tzung-Bi Shih <tzungbi@kernel.org>, 
 Brian Norris <briannorris@chromium.org>, 
 Julius Werner <jwerner@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788789655; l=3008;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=YAgyDv+00NlMfBI48daNj603uX3psSBnQCjEdKjLrPA=;
 b=WHNy1rFomYD3aDjsNKbv4C8y+mqAIrV++jJIFNpZpRsZA6nBoQEoc5ZSNVO7kLakMzw2WrA97
 idrqAzO5HtbBoxxRFUafh3XamGIZJjkelaQDBxhMHTnXNEnrc6sXMKw
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a named initializer for the acpi_device_id fields which
makes the code more readable and consistent with how lists
are initialized in the rest of the kernel code base. Also
drop explicitly setting fields to 0 where it is redundant.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
This series is converting lists that contain the acpi_device_id 
struct, which is defined in the include/linux/device-id/acpi.h 
to make use of named initializers (which they do not use currently).
This work is part of the on going effort in the kernel associated
with device-ids [1]

The plan is to convert acpi_device_id::driver_data to have an 
anonymous union, similarly to what was introduced for PCI and I2C
device ID tables.The goal is to increase type-safety (as most of 
the existing casts are gone), to improve readability and to make
use intent a bit more clear:

```
union {
	kernel_ulong_t driver_data;
	const void *driver_data_ptr;
}
```

But for that to work all lists containing the structs need to 
use named initializers first to avoid triggering -Wmissing-braces.
I already have patches that implement this and touching a lot of
kernel subsystmes that use the acpi_device_id struct and that list
keeps on growing. Therefore, I have decided to split the series per
every subsystem into:
- pre-clean-ups that convert the lists to use named initializers
(which is this series)
- actual implementations that make some of the modules use the
driver_data_ptr union member

That way the task can be fragmented into manageable and independent
chunks of work and makes this effort easier to review.

Tested builds on a64 in Yocto using 7.3-rc1.

[1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/
---
Changes in v2:
- Rebased on linux-next
- Link to v1: https://patch.msgid.link/20260904-acpi-firmware-v1-1-7e4d7a09198e@thegoodpenguin.co.uk

To: Tzung-Bi Shih <tzungbi@kernel.org>
To: Brian Norris <briannorris@chromium.org>
To: Julius Werner <jwerner@chromium.org>
Cc: chrome-platform@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
---
 drivers/firmware/coreboot/coreboot_table.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/coreboot/coreboot_table.c b/drivers/firmware/coreboot/coreboot_table.c
index 25ee8cf53429..2c8c928fbb33 100644
--- a/drivers/firmware/coreboot/coreboot_table.c
+++ b/drivers/firmware/coreboot/coreboot_table.c
@@ -250,8 +250,8 @@ static void coreboot_table_remove(struct platform_device *pdev)
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id cros_coreboot_acpi_match[] = {
-	{ "GOOGCB00", 0 },
-	{ "BOOT0000", 0 },
+	{ .id = "GOOGCB00" },
+	{ .id = "BOOT0000" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, cros_coreboot_acpi_match);

---
base-commit: af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
change-id: 20260904-acpi-firmware-5c9fd18aaea0

Best regards,
--  
Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

