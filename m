Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B117C
	for <chrome-platform@lists.linux.dev>; Sat, 29 Jul 2023 00:51:38 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1bbc2e1c6b2so18038805ad.3
        for <chrome-platform@lists.linux.dev>; Fri, 28 Jul 2023 17:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690591897; x=1691196697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6jtitKPmPv1QZ35jWw/TxRZ9JZX7OXyPiqS7eZQkRX0=;
        b=ZLrGn05MUkHmy9umqhyalvo6jULTXifsXM898LgnZypiokj4DbhjGA2DKicQPylNZT
         bsHjkWRTsweAmrnW45in3M5LlfLJlb/BdWnvDJ6/iSj99oJo58PBy8L1wWtX9ojkLAIg
         ZA7J1phe7ohuI6F1saudthk0P3MEGpTLuXOO7Wydxqc2SmBo6g4iZJ+z/3wQEuRp39zI
         aW83IzmOs9balI94wHr4x83W9RbgCVokkkGgv+Kk+V7FSk2//UI3IDchr2sahlJaNhZd
         Zs6ynTqSZzEgqNkv3AkqEexfYs4Qx7JTtF1sJIBa/A9ONGMb96/x171Phf1CjcLQoMJ/
         6NCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690591897; x=1691196697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6jtitKPmPv1QZ35jWw/TxRZ9JZX7OXyPiqS7eZQkRX0=;
        b=Je/CtieP2re14KY1yrkwYNovtHDfJeK9DzQM/sF2wWBqsKO2nu79CldaoUn/xRsDQ2
         2FCBQyNU6V1G7Yy0y8fwWZ+moy+enErQOEJu0EGkWinym/GrLXi4yteTlGYrTIM7Qt7x
         8O4SR4sG4+T0ITVFEZ8I16t+Zpl4KyOoppLblg+7QIqepzPl4p1V8cZ+5eOtC0OnDWCg
         WQMO5cvs4WbnT2wvDUN6vdEI0r0DuUWSfLbFx35kXaxtfONjB1rKXmDkIuLo5BiPIPem
         NlusYu8qyQMFffnfyR6wZHOKnWFdGovhJ/mtBmN63xiOeMpBxVKrY2X85aHVQsUhkysX
         HK4g==
X-Gm-Message-State: ABy/qLbWpf+wU3xXRddkSJDnA7lmyURHvLkB4mz+EJ1qaYnGaya3SNLd
	YRXVwAmabKWiLgopnRJm63g=
X-Google-Smtp-Source: APBJJlE1c+ch5XpoWIAq/65XLons7xmMFKcehpJoYCmLqy5YYddBugUThZZxJGZXqs+SYttzVNxZVg==
X-Received: by 2002:a17:902:b7c5:b0:1b8:9b5e:a218 with SMTP id v5-20020a170902b7c500b001b89b5ea218mr2523742plz.42.1690591897281;
        Fri, 28 Jul 2023 17:51:37 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:9d:2:bc93:3749:59cc:1d5c])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902704c00b001bb97e51ab4sm4149524plt.98.2023.07.28.17.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 17:51:36 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev
Subject: [PATCH 01/22] Input: cros_ec_keyb - use device core to create driver-specific device attributes
Date: Fri, 28 Jul 2023 17:51:10 -0700
Message-ID: <20230729005133.1095051-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of creating driver-specific device attributes with
devm_device_add_group() have device core do this by setting up dev_groups
pointer in the driver structure.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/cros_ec_keyb.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index e7ecfca838df..313b7a69dd69 100644
--- a/drivers/input/keyboard/cros_ec_keyb.c
+++ b/drivers/input/keyboard/cros_ec_keyb.c
@@ -686,10 +686,11 @@ static umode_t cros_ec_keyb_attr_is_visible(struct kobject *kobj,
 	return attr->mode;
 }
 
-static const struct attribute_group cros_ec_keyb_attr_group = {
+static const struct attribute_group cros_ec_keyb_group = {
 	.is_visible = cros_ec_keyb_attr_is_visible,
 	.attrs = cros_ec_keyb_attrs,
 };
+__ATTRIBUTE_GROUPS(cros_ec_keyb);
 
 static int cros_ec_keyb_probe(struct platform_device *pdev)
 {
@@ -730,12 +731,6 @@ static int cros_ec_keyb_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	err = devm_device_add_group(dev, &cros_ec_keyb_attr_group);
-	if (err) {
-		dev_err(dev, "failed to create attributes: %d\n", err);
-		return err;
-	}
-
 	ckdev->notifier.notifier_call = cros_ec_keyb_work;
 	err = blocking_notifier_chain_register(&ckdev->ec->event_notifier,
 					       &ckdev->notifier);
@@ -782,6 +777,7 @@ static struct platform_driver cros_ec_keyb_driver = {
 	.remove = cros_ec_keyb_remove,
 	.driver = {
 		.name = "cros-ec-keyb",
+		.dev_groups = cros_ec_keyb_groups,
 		.of_match_table = of_match_ptr(cros_ec_keyb_of_match),
 		.acpi_match_table = ACPI_PTR(cros_ec_keyb_acpi_match),
 		.pm = pm_sleep_ptr(&cros_ec_keyb_pm_ops),
-- 
2.41.0.487.g6d72f3e995-goog

