Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77B646D579
	for <chrome-platform@lists.linux.dev>; Fri,  4 Sep 2026 11:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520152; cv=none; b=Kzd76F2fWlvySm2u99YhlcLsYznGJLRnfgniYxGCEKZWEaZsmejZPJHcZFuPx/fDPMV4Q2y5tjocABMu1zrfGiwdPJTNnIM2XL0u5Il+cWM5JukpZT6cGlFrpo03pxYtPTYaOAmHVt7NpnZQh7OWVMfX0rzITacXOHzwvDAXWjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520152; c=relaxed/simple;
	bh=NqgGWJeZVR7RxI+s0Oxqgtd29vzuC+T0iE7FmCCyjQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vDPsaTwEjhTizvSImMn/vqJoZOdCnu2p5bkdSa3NrrmON68KxbvG4edOz4Frzv7gCIcySsXAcX3kTJhWA3R6OMECmWdCAa3SecN5QKgvDoIx6YyWogIBYEENVnBYHarA7UnEspBSOs6HG/MfluFLcNJyNiDYkN2KBrCi4KqaFbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TP5WjNGY; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TP5WjNGY"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6b1b233ca98so647127eaf.1
        for <chrome-platform@lists.linux.dev>; Fri, 04 Sep 2026 04:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788520149; x=1789124949; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EBPQhnDSu07cLC3ptpbpaZlMTGWNfmchne8qnaFZmRI=;
        b=TP5WjNGYHZHDzvAamB/CEZvRJ/6J2zu5/5cdpHnz9CVXa5TdlllanREO6aj4dIk+ie
         qXfPHNg4gmjUA9Qnso+vgaJFEM0O+udpmxhWrh0izOXpF6eiEYyqoQ8MEGls8hIHf7nJ
         SMjhEGVDwEZY4wGauA1AYU6a+wwVB7CwkhlgXMOLaV5AKY64L5+cc2KHKkSqnNwYEXB3
         9gOVnyoRhCXwqL10KGFkxpgjiQQwEdd63PR9IZk73JLR5UE+dzHyCMhIRAkeulfjtjAt
         KuvjHI2mp/ZXGRndLXnwlf6rnySkLbPjYHvjnr7o4+QQrN7I1M6k+Qc65bJncYq+sIy8
         PBOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520149; x=1789124949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EBPQhnDSu07cLC3ptpbpaZlMTGWNfmchne8qnaFZmRI=;
        b=YRbmlK3bzrbk0QHPkIRaN7LUPFSqhtJNhgdeLypj3txH2QegoxtePrnxVWGbLfbauw
         m+L82Sn+ozvB+D1VdSt2Jf6SPwvdIQX4bxWowMbDZIRIvsUn2mYhyQjEY0iTbA1cAF77
         kFW6wCOfi9mnQsbT4O2KksyJzGgpZne6Wyq7+g3e0qoOrSiUqiKWvDgWhK5RY8cM/7yO
         cosTm7BB8c48+1klA84y+Bxp2Oovf6JjPkD5ZvIckZW83ZQdonLOlm0TfWLLucDwsI+b
         Ci4AvHiGe9+e/y/7mX5uzPcYs2FDvuLIjDtOXCrH2AjvlIRcDT+85dyWswj5xz6RWinp
         k6zQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwjJZZ5aitviVJJpJ7CSC9VWQzO34yxO1vTc+rnHfRW5rE7Lt/x+KT5Jv4rh+dREcnZYrLx9KbfSeVzc8u2kk=@lists.linux.dev
X-Gm-Message-State: AFuF++k1V1e8yDjnPZH2mWsMuV8TcxM4k6xK5ZPW2x3DkXs/PlATXtrZ
	nRq+BacGnAENkVnuhkk2SggA9T84lYhaex6UTEVmDg65g46zBXCDZPqn
X-Gm-Gg: AYBFou0/w5BRraJSCIWxxJIR6HX+NKFm8HWE8IQdKyCiCZIXG+AF4+lEmwf/YTDBSRj
	tv/CtKc0RnjLRNgxwB87i9Ma/Z8aOpOct02JbrrpVUwet9LMXiXaJnMZk5oX51llf2YHdRmwdBz
	v3rqe8zKhc0rD2LyItnKK7l7fgJ6RcaHD64O4b2NA/JrJoqE7aulGtkSwnDLNjuG6svTsXkQJ+i
	5aDAZYaZ5FbsQWA2mAf4C8eWTq6ja3gkzxSg5/p6FsaYXduO0VbSQ/9ihzc4hqgJ/V9Gt4Fo8O4
	AfLDO0wcNBxqUGE3kxXfPFzRvBLNC4d9dnK1BnFPvLuRLoY7rqEk/teLLQuerL8QTcHcxGKdORR
	dz8Q8cx3kiDNglLFl6iOgXphzA2XeLjkErrq9u2YDNiBvDC8Q+kMUztKqa6ZVjIepxCmbzjxtzQ
	j3J3NFB6FPlZN2QJbqWBh9aDi5ah/upV2c6nKG75/jsD4THrX3xuYQMDHH6p0bRTMl3ESgeoXBu
	3+QEpwIIbqE4Lk=
X-Received: by 2002:a4a:edc4:0:b0:6b7:8415:d793 with SMTP id 006d021491bc7-6b78415d8efmr1183603eaf.62.1788520148792;
        Fri, 04 Sep 2026 04:09:08 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b123731sm5599656eec.18.2026.09.04.04.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:09:08 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Jameson Thies <jthies@google.com>
Cc: linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH 1/2] platform/chrome: fix typos in comments
Date: Fri,  4 Sep 2026 16:38:57 +0530
Message-ID: <20260904110900.20435-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904110900.20435-1-hemanth.selam@gmail.com>
References: <20260904110900.20435-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/platform/chrome/cros_ec_ishtp.c     | 2 +-
 drivers/platform/chrome/cros_usbpd_notify.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_ishtp.c b/drivers/platform/chrome/cros_ec_ishtp.c
index 3766cef81fe8..b21a27ad3762 100644
--- a/drivers/platform/chrome/cros_ec_ishtp.c
+++ b/drivers/platform/chrome/cros_ec_ishtp.c
@@ -369,7 +369,7 @@ static void ish_event_cb(struct ishtp_cl_device *cl_device)
  * @cros_ish_cl: ISHTP client instance
  * @reset: true if called from reset handler
  *
- * This function complete the initializtion of the client.
+ * This function complete the initialization of the client.
  *
  * Return: 0 for success, negative error code for failure.
  */
diff --git a/drivers/platform/chrome/cros_usbpd_notify.c b/drivers/platform/chrome/cros_usbpd_notify.c
index d842c05f4db0..6f5eea4938cb 100644
--- a/drivers/platform/chrome/cros_usbpd_notify.c
+++ b/drivers/platform/chrome/cros_usbpd_notify.c
@@ -64,7 +64,7 @@ static void cros_usbpd_get_event_and_notify(struct device  *dev,
 
 	/*
 	 * We still send a 0 event out to older devices which don't
-	 * have the updated device heirarchy.
+	 * have the updated device hierarchy.
 	 */
 	if (!ec_dev) {
 		dev_dbg(dev,
@@ -115,7 +115,7 @@ static int cros_usbpd_notify_probe_acpi(struct platform_device *pdev)
 	if (!ec_dev) {
 		/*
 		 * We continue even for older devices which don't have the
-		 * correct device heirarchy, namely, GOOG0003 is a child
+		 * correct device hierarchy, namely, GOOG0003 is a child
 		 * of GOOG0004. If GOOG0003 is a child of GOOG0004 and we
 		 * can't get a pointer to the Chrome EC device, defer the
 		 * probe function.
-- 
2.48.1

