Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9288B51D52E
	for <chrome-platform@lists.linux.dev>; Tue, 13 Oct 2026 15:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904552; cv=none; b=Yg3Ps6QUCtCKO07CuItkDeGdsVhtPdSG6jUNnAviN8G74r7TuQwfkt8p8bOZeVGmnX95YoJldLe/SNy6gizVsRMAr1JLIbgQNPFnz2rbtghYhajJCEE08dIOSKw12ApC+n71Fu/VcncR4ILX4j/uoWjGOtFerViDEIv/GGLF/eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904552; c=relaxed/simple;
	bh=HmGWDDaqG9wgYzaaOhCtIlUpwfVuv7eZAzQKZvw2NO0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O79SsfLi+woyCZFqYzrDRykNHDSeW999AiUdse2LdEBX1rjUteTsTKD1CbfgqJuxorD5w5y3GwylcPPV64f8LOImLP2nCDjfFCUYHVP+/Tb5/utREXvUU31WkqWfJIVufm09ti2gVdUBDOHS033jhLoia6DCvm0b6pRSQCr4yws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=EYLl+q4B; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="EYLl+q4B"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15ea896ddc8so4416884c88.0
        for <chrome-platform@lists.linux.dev>; Tue, 13 Oct 2026 08:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1791904550; x=1792509350; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v/4xf9ixNsPOw+XXMk3VwH3ZhfDNhWjYPrvc7VQp0Lc=;
        b=EYLl+q4BL4h+PsmgiALoKTVhJJUVLQL0KgCAw9Uf0dbK+wSGVciSdNAOyYyf1xjQsV
         o2CtwTnh/C1tw75/o5gjC90WGNWp7k0QmX4S5WGPvGstyWAo287HdD6KQDQYJJkNpoR+
         7RDT2SohfghkXQTF9eZlWAjJbtxsFo/fflHPN18UHp9EkLtP13uKWGxn8oiTXclZshVc
         XipU0yJRxGjYLdsMeof2+qlxTnmblErih36GinaRhfMKuCohPSBlHuVYpa3ISBOFwVvn
         HYg5JD4HxwMEBBEqAmHcYRHFzuvweRWeDwcFVdqNiS4tqoJbEv3ZwIHXD8fC0nJegQ+3
         1f7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904550; x=1792509350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v/4xf9ixNsPOw+XXMk3VwH3ZhfDNhWjYPrvc7VQp0Lc=;
        b=EBLQW7e7Riie+ZPlNs2dFtL5cWX0sO7el81OBcWvJolH36x9gMBT1e0VfXlLZPfTxO
         EneogoQgRtD5luPBR+Oz8hra2wd2zSVE7420BCI3Lrz143UhUbV4Ahh2jRhOKm+tj64j
         zwlpqZC/ZEL9U0ayYoBDj1sstXfmZ++0zIK2a6STrr6lkR2779FayNOFMA0SS/IAAef0
         n0TBZvv1IrsNu7ki543rPp+LUAGP8iTL3tjpbBczHf8QLCZdhmYXZh9J6UTPfund1mnd
         H9YzEUIIZbQs/KO2pcAEGFSNYHKVPOEHZ2up/2ARM6LRGQSaI8C7vkNkxquUpL9JGBxo
         AoVA==
X-Forwarded-Encrypted: i=1; AKwUvBzBFY45jV7HA7EUuJ7TrffWrggIt2JCHNa8kHBtP6QSaYQXHSgPxThElJr8G6D9+q5Eww1fQRY12rTwjf+w5rw=@lists.linux.dev
X-Gm-Message-State: AFq9FYLcAS3oC3XSHjQ9mIMLIhfQNbdh7azkJmjNRVrEEVXhuaj/uDz6
	1mbT82e+FhIkY4FeWCLg0zOReJPRPQtOwcc9uaOJrHYc6UL+RJmsLwtkPCYqaLINlAc=
X-Gm-Gg: AYBFou2GoaWhp1iRfftvbo2ASDTmL8rfyBdz/G1RqwBbWbAsBzrzSxQD+UgE/m56dFp
	2FaKWi1N8AP6by0nE0lXLbfTHryZ3ssfal1vcopdcIF9LaBSB85/sSXxhNTa8Gzx/ndn6tlj7hT
	8/Mjyn7gvR8/jyz0Qpkx3F0KfkU1uXgi++3YQKvUJajTKMZDux1AMJId+r3BqliFx5diu0HqwWB
	xLCp3/EtfF0UgBke++vvzSirfJeSYsE0CacgdaZ//eL660v/P08kuiDZUUjEsOVair7YiH8hej/
	pvLNA0Bls08Zz3Bh6ClQrtmtyWIjoI8sKoswwYQGwaj598RKh76FWxRaKKtFIG8cOLpTrCPx7jA
	n0uqOl3zoopC///Ht4z4fgkcHhQHKIJWy92UabuMPOU4KRjlY/kueFODvr8C4RP5epAwMhsHNuh
	VTTGsxrQpWOV5OXq72MmMIl2XbgGsg1XdSO2Q+yYuAIrV7fWSe4pOvRAjw8bxCpNbvxlOaI32FN
	C3Ar2ezssO3SKg=
X-Received: by 2002:a05:7022:927:b0:150:c9c5:1ce4 with SMTP id a92af1059eb24-16a56ab133dmr22268863c88.6.1791904549516;
        Tue, 13 Oct 2026 08:15:49 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:49b8:4c98:b3d1:72aa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358de54fe47sm30691751eec.31.2026.10.13.08.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:15:47 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Tue, 13 Oct 2026 16:15:24 +0100
Subject: [PATCH 3/4] Input: mouse: cyapa: use named initializers for
 acpi_device_id
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-acpi-input-v1-3-53ad09ba82b7@thegoodpenguin.co.uk>
References: <20261013-acpi-input-v1-0-53ad09ba82b7@thegoodpenguin.co.uk>
In-Reply-To: <20261013-acpi-input-v1-0-53ad09ba82b7@thegoodpenguin.co.uk>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 Nick Dyer <nick@shmanahar.org>, Hans de Goede <hansg@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, platform-driver-x86@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791904532; l=1214;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=HmGWDDaqG9wgYzaaOhCtIlUpwfVuv7eZAzQKZvw2NO0=;
 b=orrWjgwEEFh1FiTF7HQVb9je4Hn8Voxwhgi2CmEj3dj5klRtM2XsKllESdRoEFsFHxl0ERJPf
 mOt99NSkjYeCeABG03IuTSlUlXMnG+AUxvH3Q05qFKuzUV3PACcnUjJ
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base. Also drop explicitly setting fields to 0
where it is redundant.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/input/mouse/cyapa.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/input/mouse/cyapa.c b/drivers/input/mouse/cyapa.c
index 47000c30e4d8..8a4c78261aeb 100644
--- a/drivers/input/mouse/cyapa.c
+++ b/drivers/input/mouse/cyapa.c
@@ -1463,9 +1463,9 @@ MODULE_DEVICE_TABLE(i2c, cyapa_id_table);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id cyapa_acpi_id[] = {
-	{ "CYAP0000", 0 },  /* Gen3 trackpad with 0x67 I2C address. */
-	{ "CYAP0001", 0 },  /* Gen5 trackpad with 0x24 I2C address. */
-	{ "CYAP0002", 0 },  /* Gen6 trackpad with 0x24 I2C address. */
+	{ .id = "CYAP0000" },  /* Gen3 trackpad with 0x67 I2C address. */
+	{ .id = "CYAP0001" },  /* Gen5 trackpad with 0x24 I2C address. */
+	{ .id = "CYAP0002" },  /* Gen6 trackpad with 0x24 I2C address. */
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, cyapa_acpi_id);

-- 
2.53.0

