Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA15114F70
	for <chrome-platform@lists.linux.dev>; Tue, 16 Jun 2026 00:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781568856; cv=none; b=RnF7I2I7GxGWgStZc4fpTCruSoY9XQ80WL08mDJEPF7ox+YNU4CdhbazouLieXptEWqaijS3rpV3Pn5wSR6oCP/e5J0aBHvoLXBhWJPzFTL132GWGKwTxg177smD+yiQl62xix3oUPBuu0ov59J9N4+4I2jVE6J0YqwuIJ1aU0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781568856; c=relaxed/simple;
	bh=PBtFm/zKDyjSh2crVZTtnH4K03swvX+ZKCjR+r4PrDU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OiVqQhqICBljjbiskwL+mk/Or3P3h0zxKK5WeI/9txt59MPrPkdQx+wq6y/1Alegz5fj1PkfVEpniK/qhM3IBDexd5k++dHimgfb8RcZvTh9aWzxr+41STpnrNRqxyc9U564BWwqa49sQrwYkPF0tnL5diZAAhe1l2lFGa6xDnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ntQx+SvT; arc=none smtp.client-ip=74.125.82.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ntQx+SvT"
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-13981833e13so1233967c88.1
        for <chrome-platform@lists.linux.dev>; Mon, 15 Jun 2026 17:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781568855; x=1782173655; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=233cLHTZS4iyH+uhDwqP5xh+kpTAxlUpXxK+DEjpZ1I=;
        b=ntQx+SvTKHOlaIZfs1ZirGRi3FU9K0VHulZCcGUFDKaXtIGGPsANIP58uK2o8sLDm1
         TTxNysTvpVNdFhFhAkDaiZfka2Sb/jmWMEecuQ3Jg5dMkMjyGUpuwPmreAhFJWHp/Hlu
         6JyssmxZDdd2ODLGrCN76I1uL+VFcvBda5oMhSaJk+oVLcaY/d5P0xqDGk6MGUFT3OHp
         FoYOjiBWe0KAvuFffMcqHc6UWSLX0AKuKT0+1uGc+vL4WCwQ60H7K6aNytTHRAtTZ9KQ
         xWERZXr+b6jcETwRGctuH1642AiYzNovew/NQHx78c7XOGRWa/SRjxqsR6TqlEBkg+6b
         OMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781568855; x=1782173655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=233cLHTZS4iyH+uhDwqP5xh+kpTAxlUpXxK+DEjpZ1I=;
        b=PUMfyYPR7Hsb4Ftnu6wOdjshuV4dEtgXw6zB6TYo0QUDFl9znnV+vo83sk2pElyDHd
         Dol23twGGgL3mJKulsIc9QwQraPFhusacNY0PbhPM+D6yXBaspK36fAo6JdzgkRmMqkJ
         MOwOHv0CzUjzIjllcLkYdEJwTnCleYxPxCjztQWlwDPYXtwD/wB70Tj4tRv1PeiRUAOg
         RgK7YjbxJZtZ/joZdmpGbgDVADOudEQ8p102LIL/jYJqGlvbfnL8b7wYm3loXnpjEUOg
         pgKDyW35462wTeSHg7V4L6+mn7QBcANj8FPlJMvCW/gWshBgF4ms/hQ/RDtkLLkCik3i
         5rLw==
X-Forwarded-Encrypted: i=1; AFNElJ+RerYAZSULzwmdSfbo5w95tL6j1YyV8AwD8wkYhoELS8iiGPleEqAONsdcXVsZmhEnpR0oriphJ+fNIdYA3ok=@lists.linux.dev
X-Gm-Message-State: AOJu0YwpHglIknbrHaCJYmEDEpURTFBr50hA57CHyzBiUFpoGR+OxCj2
	+uSdixLVgRHTZ3VCGJtlraXaJVLfmpn1NqX/7FQz4teKpI27qzdmLRXs
X-Gm-Gg: Acq92OG8bxcQCd7GspVcUqd+cULjKI2VKgNJ+/iz2PdHTVY8sgTy6ZMyS1t2ZT/+6aw
	4+UQxIIjga0TnKyBMRA1PJVwjGzFiig5s9/yaH2wPBuqCiZl3iD/2nONDQTHK3OzXYayGm49f3g
	UwypQVOJQ15CAeHDaYgGrRlH/8u7YTrOJXOWc27vp/chy4MAaDSrwmscszw9RaqgmHNE8vZeW7z
	rEiFWHyXK3nM8MIoPZpjgukBlw6sCSHBtl3B4znLdIajT0JRlY0ocUD0i3IiBCCRGXc07WlVOmo
	eJhYKof40QIgSqXxUpmXoM8IWHI0rYgjrt5r+4072ebBO3Kcidsz4u5m4wjSGEwOkuk4vXgsq3U
	4hcQQAR6xstLcvSDVTLcptOZAqMocbSBga68eP3Mm3GTkeUMoR7NbKEX9c/utkkOKeycPJTfyPv
	ZWmTixlrBmuV8aMFU2meH2kRu+L3yKisVtRwtZDO8S5YEfKC7/M4dmxjt8KD0HP3LE3AkdH8u0h
	2FOro7lPVJL5XlKNPYR4Vf+BflU/vYHGTubDdRZwD3GcqOf5O9WsOpuN1AtXU4HTbT7mJt2SogA
	T4i7+Mo1F6pydnkiZg==
X-Received: by 2002:a05:693c:3946:b0:2ea:5057:a331 with SMTP id 5a478bee46e88-3082005f45dmr9528189eec.21.1781568854873;
        Mon, 15 Jun 2026 17:14:14 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e920243sm16946372eec.18.2026.06.15.17.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:14:14 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Gwendal Grignou <gwendal@chromium.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sung-Chi Li <lschyi@chromium.org>,
	chrome-platform@lists.linux.dev
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Benson Leung <bleung@chromium.org>
Subject: [PATCH] platform/chrome: cros_ec: remove reference to nonexistent CONFIG_SLEEP_TIMEOUT_MS
Date: Mon, 15 Jun 2026 17:14:07 -0700
Message-ID: <20260616001411.66231-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A comment in <linux/platform_data/cros_ec_commands.h> refers to
CONFIG_SLEEP_TIMEOUT_MS, which has never existed in the kernel. Simply
remove this reference, as the default timeout is defined immediately
below the comment.

Discovered while searching for CONFIG_* symbols referenced in code but
not defined in any Kconfig file.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 include/linux/platform_data/cros_ec_commands.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index 749d985e9da2..3c0b9dff80b3 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -4368,8 +4368,7 @@ struct ec_params_host_sleep_event {
 } __ec_align1;
 
 /*
- * Use a default timeout value (CONFIG_SLEEP_TIMEOUT_MS) for detecting sleep
- * transition failures
+ * Use a default timeout value for detecting sleep transition failures
  */
 #define EC_HOST_SLEEP_TIMEOUT_DEFAULT 0
 
-- 
2.43.0

