Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171B9212FB9
	for <chrome-platform@lists.linux.dev>; Fri,  6 Dec 2024 23:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733528325; cv=none; b=XlFxGgzC10Ng7tv3f4GAp3ItmtacWvq2ufjKVbqNtVxppKKkCaUVR8y7pubM/qHlNLJQei5LhIg/k45HulTaH5kcD43ISu0MUaJbr4pH45xCYG1TNVlg6104aBOiN/rwsln6qaPe9GVIYfRhqZjCoJIp64eXgmE6325DIAFuNnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733528325; c=relaxed/simple;
	bh=Wa7Kv7PricBjMroxEO0Q9NJCwPJQ0U69/lCUJwLLOoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NyVmg48opOkFaoOCpb9UxxNl6UHGBlm6vMAuzSZR+tpvxkpMMvm4K1F5f7D3dE88O25aTL9BgCpnrJ8DczSqmBpVJMqdTlfDofMzxxQazSzIggqixTWMSUGJA9BOxmJs+TAwdwDRc7ZT9CDZMOiuNwE5wm9wVIP06esPB8qDsRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SrSf1kxm; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SrSf1kxm"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-725abf74334so2251960b3a.3
        for <chrome-platform@lists.linux.dev>; Fri, 06 Dec 2024 15:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733528323; x=1734133123; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=npc5/EXwRgV9fZkcYMR5vMPbJLkeKsCQO+ev3yk2o1U=;
        b=SrSf1kxmuSu73dsnPtyawR4Lwt3HWXtiTVoo+ah19CUhZiXJCvzfv5O7HeLJYPRxCq
         VPJAcPlWpJBr2H8W+XH09vcOTTHo+1ssytUUKYmOwPZ0BAqpP1eBVCnWL9AWYYQIwJly
         3KsrQ4TUCG17FW4WLYZitpr0MqrIJSCn3Be4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733528323; x=1734133123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=npc5/EXwRgV9fZkcYMR5vMPbJLkeKsCQO+ev3yk2o1U=;
        b=Dg5yQ+Rl60spDLETr2qb9sLSdm4FLVu3JRRnQkqY56VtkGR/CD10Ajomf1n5IReFxj
         +nga677eH1B9CVm62tcyRrjtnt0fPP4cl+DtwSA55DqhsYcE9e0olVyt7i0T51ny65D6
         9GWFF9j/AQrgnvjmQcsCRbmoYXSNq5qyAF+mFmTbvhYoQR3fhLU9jG0LQdPpQ+9yjfaW
         ToDQb6RttIUxWFAQnefbI+4HpfprtDjKpmYC5l1IcakD/W1NzLUirl87+tKA8hkxZSRF
         hIP7AjOqWOqFmU4x7AIjG6Fj/b+ndg1TtyJVMiAJPB3E0eNrN8XM/ljm1wuHMg0wjfIc
         CTwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXx4zDz9dpXmaprWBoyYWqrIa1nGxvSNcY3RbseQp0DolMrmlJRF0HsPqTKooX13vFwaqwlCjRF1Mk9Cog6AGo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwyBeYH9AoBTPPF5V9g5ziqzqzIyyPx0obadCen5Xdv+dYqxe0N
	1iVMdWDvsi5n82bFHSE7IMw/o5+9SmH1Nr2FdN0sbRsGuT4u8+kHYQHWQcPpQW6Z9iZfBqMZB/c
	=
X-Gm-Gg: ASbGnct12+Mt7/xpWbfe3j9RarmI4Llwf6i0fRe+DmAhXKQyzEees97BKUpJTKXszVm
	JW3F/poDK2IGa2z4XsgMzkraj/ZzWGQfBJityzkipsnS/7wf4oSsDs3oB0GUmxv0FqaEd13rn3y
	lRmcQx0KjyO1CWpAcUVEXRsnlu6XJ/EZ+QKtfAkWMuv+H0QjA1pvQv1F2LAat4v/2SJ6C7njRtk
	ZHo03m5taXw3EjWMerOdZU+SkLXlmw2zIm3rNwDxSxjYltk9X6Lplmm7GLL49eOC+8inWb6/sLO
	Yh/CmjXbpP4DSlRQFpYz3uKI
X-Google-Smtp-Source: AGHT+IEwnZn4JmHjf3RRZuf4aJQ3xLLJws8lCWbViXA/5lZ1RWNF9JnUYcLQmuMX0s00k7x5Jh8dAg==
X-Received: by 2002:a17:903:110f:b0:215:44fe:1640 with SMTP id d9443c01a7336-21614d1f22amr59537635ad.3.1733528323337;
        Fri, 06 Dec 2024 15:38:43 -0800 (PST)
Received: from localhost (227.180.227.35.bc.googleusercontent.com. [35.227.180.227])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-215f8e5f2d6sm33999035ad.71.2024.12.06.15.38.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 15:38:42 -0800 (PST)
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To: heikki.krogerus@linux.intel.com,
	tzungbi@kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: akuchynski@google.com,
	pmalani@chromium.org,
	jthies@google.com,
	dmitry.baryshkov@linaro.org,
	badhri@google.com,
	rdbabiera@google.com,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/7] usb: typec: Only use SVID for matching altmodes
Date: Fri,  6 Dec 2024 15:38:12 -0800
Message-ID: <20241206153813.v4.1.Ie0d37646f18461234777d88b4c3e21faed92ed4f@changeid>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241206233830.2401638-1-abhishekpandit@chromium.org>
References: <20241206233830.2401638-1-abhishekpandit@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mode in struct typec_altmode is used to indicate the index of the
altmode on a port, partner or plug. It is used in enter mode VDMs but
doesn't make much sense for matching against altmode drivers or for
matching partner to port altmodes.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---

(no changes since v3)

Changes in v3:
- Removed mode from altmode device ids
- Updated modalias for typecd bus to remove mode
- Re-ordered to start of series

Changes in v2:
- Update altmode_match to ignore mode entirely
- Also apply the same behavior to typec_match

 drivers/usb/typec/altmodes/displayport.c | 2 +-
 drivers/usb/typec/altmodes/nvidia.c      | 2 +-
 drivers/usb/typec/bus.c                  | 6 ++----
 drivers/usb/typec/class.c                | 4 ++--
 scripts/mod/devicetable-offsets.c        | 1 -
 scripts/mod/file2alias.c                 | 4 +---
 6 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 2f03190a9873..3245e03d59e6 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -791,7 +791,7 @@ void dp_altmode_remove(struct typec_altmode *alt)
 EXPORT_SYMBOL_GPL(dp_altmode_remove);
 
 static const struct typec_device_id dp_typec_id[] = {
-	{ USB_TYPEC_DP_SID, USB_TYPEC_DP_MODE },
+	{ USB_TYPEC_DP_SID },
 	{ },
 };
 MODULE_DEVICE_TABLE(typec, dp_typec_id);
diff --git a/drivers/usb/typec/altmodes/nvidia.c b/drivers/usb/typec/altmodes/nvidia.c
index fe70b36f078f..2b77d931e494 100644
--- a/drivers/usb/typec/altmodes/nvidia.c
+++ b/drivers/usb/typec/altmodes/nvidia.c
@@ -24,7 +24,7 @@ static void nvidia_altmode_remove(struct typec_altmode *alt)
 }
 
 static const struct typec_device_id nvidia_typec_id[] = {
-	{ USB_TYPEC_NVIDIA_VLINK_SID, TYPEC_ANY_MODE },
+	{ USB_TYPEC_NVIDIA_VLINK_SID },
 	{ },
 };
 MODULE_DEVICE_TABLE(typec, nvidia_typec_id);
diff --git a/drivers/usb/typec/bus.c b/drivers/usb/typec/bus.c
index aa879253d3b8..ae90688d23e4 100644
--- a/drivers/usb/typec/bus.c
+++ b/drivers/usb/typec/bus.c
@@ -454,8 +454,7 @@ static int typec_match(struct device *dev, const struct device_driver *driver)
 	const struct typec_device_id *id;
 
 	for (id = drv->id_table; id->svid; id++)
-		if (id->svid == altmode->svid &&
-		    (id->mode == TYPEC_ANY_MODE || id->mode == altmode->mode))
+		if (id->svid == altmode->svid)
 			return 1;
 	return 0;
 }
@@ -470,8 +469,7 @@ static int typec_uevent(const struct device *dev, struct kobj_uevent_env *env)
 	if (add_uevent_var(env, "MODE=%u", altmode->mode))
 		return -ENOMEM;
 
-	return add_uevent_var(env, "MODALIAS=typec:id%04Xm%02X",
-			      altmode->svid, altmode->mode);
+	return add_uevent_var(env, "MODALIAS=typec:id%04X", altmode->svid);
 }
 
 static int typec_altmode_create_links(struct altmode *alt)
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 4b3047e055a3..febe453b96be 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -237,13 +237,13 @@ static int altmode_match(struct device *dev, void *data)
 	if (!is_typec_altmode(dev))
 		return 0;
 
-	return ((adev->svid == id->svid) && (adev->mode == id->mode));
+	return (adev->svid == id->svid);
 }
 
 static void typec_altmode_set_partner(struct altmode *altmode)
 {
 	struct typec_altmode *adev = &altmode->adev;
-	struct typec_device_id id = { adev->svid, adev->mode, };
+	struct typec_device_id id = { adev->svid };
 	struct typec_port *port = typec_altmode2port(adev);
 	struct altmode *partner;
 	struct device *dev;
diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
index 9c7b404defbd..d3d00e85edf7 100644
--- a/scripts/mod/devicetable-offsets.c
+++ b/scripts/mod/devicetable-offsets.c
@@ -237,7 +237,6 @@ int main(void)
 
 	DEVID(typec_device_id);
 	DEVID_FIELD(typec_device_id, svid);
-	DEVID_FIELD(typec_device_id, mode);
 
 	DEVID(tee_client_device_id);
 	DEVID_FIELD(tee_client_device_id, uuid);
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index c4cc11aa558f..218ccb7150bf 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -1343,14 +1343,12 @@ static int do_tbsvc_entry(const char *filename, void *symval, char *alias)
 	return 1;
 }
 
-/* Looks like: typec:idNmN */
+/* Looks like: typec:idN */
 static int do_typec_entry(const char *filename, void *symval, char *alias)
 {
 	DEF_FIELD(symval, typec_device_id, svid);
-	DEF_FIELD(symval, typec_device_id, mode);
 
 	sprintf(alias, "typec:id%04X", svid);
-	ADD(alias, "m", mode != TYPEC_ANY_MODE, mode);
 
 	return 1;
 }
-- 
2.47.0.338.g60cca15819-goog

