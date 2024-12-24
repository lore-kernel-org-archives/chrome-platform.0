Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939BD2135CA
	for <chrome-platform@lists.linux.dev>; Tue, 24 Dec 2024 18:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735066569; cv=none; b=iBPPQ6dHLzrd109aqZKXSr84tmeg5e0A2660Geyq02CHQZwtHuX8z8VaiH9iSrC46CROBsQT2kNKJjqD31sZuXPhxIQeVgHHIlwh21Xtp6XbiVucRIP3NSfZYJqwwp11K1B0n//Y9YtGnWmkZ6kvtuZ93cT5hbWYu/bJoio8fYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735066569; c=relaxed/simple;
	bh=7pinphWaXHVtgoKsyiRxVjkHW3SKo0mhTH74ygL/6Sk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ERt/cj5F4AK3a1HsS0Cl3aGkZ8xmFm30qFOqj+0PlHPt2ReKPL3qNyPA0hU0JFHTsScJXapAemvU1lTWozxffH0x+KuxhAkq4b+TYjGGGI62GKwk2NYgLzbk+qXrkvxrzHb96ISxmQrRZaAI2mIyDiRdqqQ75WTmfBgBwpW0bzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=howett.net; spf=none smtp.mailfrom=howett.net; dkim=pass (2048-bit key) header.d=howett.net header.i=@howett.net header.b=Ny2g7vJz; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=howett.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=howett.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=howett.net header.i=@howett.net header.b="Ny2g7vJz"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4678afeb133so54470731cf.0
        for <chrome-platform@lists.linux.dev>; Tue, 24 Dec 2024 10:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=howett.net; s=google; t=1735066564; x=1735671364; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LXXYUkFRD7E3IpZu6O0CPYxfUbXL6nnPux9jlxQUGk0=;
        b=Ny2g7vJzgFyRZZhLHrNagvKh+eWL99Gb7TY4XrKJzNGPDZ8AM6ffA5IxHpFAFs7yOO
         RgRXp/BjH4FpzrrW7ZYxphVC/mz3YC7DaHuqE/zfmO/Bmsrv1rYGbzQGX+QZmxQDt4Ie
         IW0rccFE/sBP6ngCFnTYG0jr3V5gIz6w7oMFIIn9P+7NV32n8pp8tP7krSSkBCB5zjV/
         l+HdqF3ZWe1pszDw5dDVbqGSCxyDSk5YnZhPJFP4l8vfKFd+wt7rCq+lxqNuwcGMocO1
         1wJWzhxlh48g/Dbkwvijal65+LTpqW2Uzs1PeWb909UVBQMCP464oq6wLygtukOJdRU5
         bblQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735066564; x=1735671364;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LXXYUkFRD7E3IpZu6O0CPYxfUbXL6nnPux9jlxQUGk0=;
        b=TSR4bdk5+/MbZF6RmbG41WNWN+iMkVgzJJ/BNjLl+celxawlsUIfNAldtj1kcWhHzI
         CbUDycPCPuMrtgO+T2LIEuIHKmFgkkpYMtWsv25vDWCzfLQIU4AMHZUNBg6W+CAw89h6
         kWcu3pCRnVY3ymnOHaprhiuRSwy4i26lBBkq9NuOpjV9DFz2T4e9BY2I5H1zjD7MMq4s
         BMnWoJufx3rxBPbh8v8qK9Rd55r50A+n60T6ZFIq2CI0lUK/0VFdhBFSRLQhuWKCeDDK
         psmkTe/BmuksBATVuqXIESAuQH9qcykghjpZKkmb3IKb70SR/0EPkNY4K80LwRrTsg91
         /JHw==
X-Forwarded-Encrypted: i=1; AJvYcCVZJRKALAmE59jPUdKgYFgNWBPyqpqCCZrjzvbXPGrXYlOxGfc+nwrzm270lZ1Lpi3tBj2qN4TN/I6H2ro5zTA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzhBXHUstKP4QasVP6ddwWHYOuhMTWTzKBHJmRX6bQrWc5AsUrY
	RzqDLQe0G3wZePQCIo3TL115IEv/aFv2H3nkjUfTMOPb9dvtLDO9eU8xvAxTkw==
X-Gm-Gg: ASbGnctJ5bHQrmCCYJow17ct/OjlHxxe4hwGKqKf1hW1DA2h5ZaaJv+O5xE+KEmR/WC
	cbt3bnTtduZ4UbI3Gt4InrOPggaHUTyPjtyej623LJO5rcm4zASdfUHkNTLrt+krMB5SzS7mZNK
	3xLAvWZcc1KUaKkILtutvp+Cimhm381dJV0EIeckvNKw7iqmgQhevmtD2wRKT7ETdipTNXGH8zn
	fAohRzmB52WjEvTa1ccWXb1/T1lptmUCC+U+Q==
X-Google-Smtp-Source: AGHT+IGfuX/I3DQg+Zsj144vhZlT7ftntU/y3W7406T/MhzcFXH0SL0TzTIxd/KrvAVWcGyDV0j5jg==
X-Received: by 2002:a05:6214:5888:b0:6d8:9bfa:76dc with SMTP id 6a1803df08f44-6dd235ab7f6mr280466036d6.7.1735066564579;
        Tue, 24 Dec 2024 10:56:04 -0800 (PST)
Received: from [127.0.0.1] ([2600:1702:5e30:4f11::6f8])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-6dd18136b00sm54642196d6.55.2024.12.24.10.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 10:56:03 -0800 (PST)
From: "Dustin L. Howett" <dustin@howett.net>
Date: Tue, 24 Dec 2024 12:55:58 -0600
Subject: [PATCH] platform/chrome: cros_ec_lpc: fix product identity for
 early Framework Laptops
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-platform-chrome-cros_ec_lpc-fix-product-identity-for-early-framework-laptops-v1-1-0d31d6e1d22c@howett.net>
X-B4-Tracking: v=1; b=H4sIAL0Da2cC/x2OWwrCMBBFt1Ly7YANkYhbESlhOrXBJBMm8UXp3
 h38uwfuazONJFIzl2EzQq/YIheF8TAYXEO5E8RZ2dijdaO1DmoKfWHJgKtwJkDhNhFOqSIs8QN
 VeH5i1xiVHvsX1AwUJKmSkOnN8oAUaufawJ+8886ex4BkdLIKacf/zvW27z8/w4HungAAAA==
X-Change-ID: 20241224-platform-chrome-cros_ec_lpc-fix-product-identity-for-early-framework-laptops-757474281ace
To: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 Tzung-Bi Shih <tzungbi@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Alexandru M Stan <ams@frame.work>
Cc: linux@frame.work, stable@vger.kernel.org, 
 chrome-platform@lists.linux.dev, "Dustin L. Howett" <dustin@howett.net>
X-Mailer: b4 0.14.2

The product names for the Framework Laptop (12th and 13th Generation
Intel Core) are incorrect as of 62be134abf42.

Fixes: 62be134abf42 ("platform/chrome: cros_ec_lpc: switch primary DMI data for Framework Laptop")
Cc: stable@vger.kernel.org # 6.12.x
---
Signed-off-by: Dustin L. Howett <dustin@howett.net>
---
 drivers/platform/chrome/cros_ec_lpc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index 588be75aeca16b6150c12d2811e4c9dfc31b904e..69801ace0496dd9ed31bc3d408c43b96ccb71186 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -707,7 +707,7 @@ static const struct dmi_system_id cros_ec_lpc_dmi_table[] __initconst = {
 		/* Framework Laptop (12th Gen Intel Core) */
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Framework"),
-			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "12th Gen Intel Core"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Laptop (12th Gen Intel Core)"),
 		},
 		.driver_data = (void *)&framework_laptop_mec_lpc_driver_data,
 	},
@@ -715,7 +715,7 @@ static const struct dmi_system_id cros_ec_lpc_dmi_table[] __initconst = {
 		/* Framework Laptop (13th Gen Intel Core) */
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Framework"),
-			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "13th Gen Intel Core"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Laptop (13th Gen Intel Core)"),
 		},
 		.driver_data = (void *)&framework_laptop_mec_lpc_driver_data,
 	},

---
base-commit: a15ab7a5cc2a17b6a803f624fcf215f4e68d56b6
change-id: 20241224-platform-chrome-cros_ec_lpc-fix-product-identity-for-early-framework-laptops-757474281ace

Best regards,
-- 
Dustin L. Howett <dustin@howett.net>

