Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626B639ADD
	for <chrome-platform@lists.linux.dev>; Thu, 25 Apr 2024 20:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714077467; cv=none; b=jKYRLSEzKwc4GnSPQh4yQ35z6ufXArCqEoiZziny6ISpJn48KyjykNa0y64PZOX6cDv5ip0yhWhmyQF/+1KyZGjgVUAC9XpocNs3i4KIehERo5uDGTMgJ7NhsUYdhEeKllQDMOfNmhEtacE7SiFL5dx1JlL6E8UNwhJmXuMJh3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714077467; c=relaxed/simple;
	bh=jAg2VLHgH1tgYvqdC05z+fR+GClul15yoSWcnQ41OgA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N5eCttmjQtbTXCP1tzdh3EurkT9l6nDdHsXcw2Cy4Gwqj4NkKVvk4ttBhPEUzoBtNHoqsoawbKBxl94Ky2MYMjtp7pWAVI1LxFmqsidzun9BAR8KhCnHqqSzV7gvX49WUQ9fcYzG+M0lyEkGl1ArwjAHsmIRgVqR8S7TDIRvzkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MGMO58ju; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MGMO58ju"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-617cd7bd929so15510397b3.3
        for <chrome-platform@lists.linux.dev>; Thu, 25 Apr 2024 13:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714077465; x=1714682265; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7H8fihR3flAk+5cySZQjU2neMKCr+gYXjQpgANOY1yo=;
        b=MGMO58ju0L5zK06YWklg0lOLLQXzIZZE7BnMTwWWMebEo4DbvXbihwAzhVshXDwwtY
         6PbG7wD8hhwtsD1SNUuxUfvjKyFsvw+ajekFdRMdMVBJFrBUzVnHbR/arYjoO2HAXWIM
         0x5m0Pr/G2df0/LLLHqL5eCvDTJ0ygqFaHbHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714077465; x=1714682265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7H8fihR3flAk+5cySZQjU2neMKCr+gYXjQpgANOY1yo=;
        b=btfL+P2LYbRHEKUGO0yIu5rx8/kD4S6kLXXiwFstPaMf87nqtSI7Pcn9GniqIJZduS
         gcSgihuB8ar01AIEc/bQW0YtQ98OWS1HX4PK7DU4djD0D4Uk3LXbfcAUIzyoT3s4Ak9U
         0walk2gYFMr7R7gCjt3QFNpQg0tYh8f3felSxc35MneY6qgmeh6lnU5gB5rjK3+JmL2k
         2sp8/Dz76jrZX4qi6rGYVodDQt6W6o2GSk9vhhGgurI8NqiPGYW4THsSGBiOUzoiFCgW
         hhXFFSjfpkyNo+nU7tmtSg24HvpN0HOAZJdgHWRNgmssRr714PLQDJ64cuQpX62hBlS6
         qh7Q==
X-Forwarded-Encrypted: i=1; AJvYcCW2gUpJnEPrkNsicjWQfsbFl/n3AcBfgGfUOKsnzHnWmU+MzjYtBk5rZ+qrePS8NgR717OBtV3LwXbgiG2vZT+ALFCMx7ABxTpGciHP1Qb/
X-Gm-Message-State: AOJu0YycEdRrM8taCfKBtkWWr53jkqidjk2iJJHRgiyYCZtTMgdhkW5w
	RQ3DGD9vytYMsyp60sga+AUs9lR6qWgpekIL9cVdhGU/mb+SkVW6nUeAql2+Xw==
X-Google-Smtp-Source: AGHT+IHwwnnESpL5zc9UPq7mHXuKXY1TvTit2/7r6Skwh8KurCpi5AxNCfahS7Bg/lfE9pI15hgY1A==
X-Received: by 2002:a05:690c:6803:b0:61b:1e30:6362 with SMTP id id3-20020a05690c680300b0061b1e306362mr783742ywb.6.1714077465404;
        Thu, 25 Apr 2024 13:37:45 -0700 (PDT)
Received: from kramasub2.cros.corp.google.com ([100.107.108.189])
        by smtp.gmail.com with ESMTPSA id s31-20020a81451f000000b0061adfb01cc2sm3751113ywa.90.2024.04.25.13.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 13:37:44 -0700 (PDT)
From: Karthikeyan Ramasubramanian <kramasub@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Karthikeyan Ramasubramanian <kramasub@chromium.org>,
	stable@vger.kernel.org,
	Lalith Rajendran <lalithkraj@chromium.org>,
	chrome-platform@lists.linux.dev,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH v1] chrome/cros_ec: Handle events during suspend after resume completion
Date: Thu, 25 Apr 2024 14:37:11 -0600
Message-ID: <20240425143710.v1.1.If2e0cef959f1f6df9f4d1ab53a97c54aa54208af@changeid>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On boards where EC IRQ is not wake capable, EC does not trigger IRQ to
signal any non-wake events until EC receives host resume event.
Commit 47ea0ddb1f56 ("platform/chrome: cros_ec_lpc: Separate host
command and irq disable") separated enabling IRQ and sending resume
event host command into early_resume and resume_complete stages
respectively. This separation leads to host not handling certain events
posted during a small time window between early_resume and
resume_complete stages. This change moves handling all events that
happened during suspend after sending host resume event.

Fixes: 47ea0ddb1f56 ("platform/chrome: cros_ec_lpc: Separate host command and irq disable")
Cc: stable@vger.kernel.org
Cc: Lalith Rajendran <lalithkraj@chromium.org>
Cc: chrome-platform@lists.linux.dev
Signed-off-by: Karthikeyan Ramasubramanian <kramasub@chromium.org>
---

 drivers/platform/chrome/cros_ec.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
index badc68bbae8cc..41714df053916 100644
--- a/drivers/platform/chrome/cros_ec.c
+++ b/drivers/platform/chrome/cros_ec.c
@@ -432,6 +432,12 @@ static void cros_ec_send_resume_event(struct cros_ec_device *ec_dev)
 void cros_ec_resume_complete(struct cros_ec_device *ec_dev)
 {
 	cros_ec_send_resume_event(ec_dev);
+	/*
+	 * Let the mfd devices know about events that occur during
+	 * suspend. This way the clients know what to do with them.
+	 */
+	cros_ec_report_events_during_suspend(ec_dev);
+
 }
 EXPORT_SYMBOL(cros_ec_resume_complete);
 
@@ -442,12 +448,6 @@ static void cros_ec_enable_irq(struct cros_ec_device *ec_dev)
 
 	if (ec_dev->wake_enabled)
 		disable_irq_wake(ec_dev->irq);
-
-	/*
-	 * Let the mfd devices know about events that occur during
-	 * suspend. This way the clients know what to do with them.
-	 */
-	cros_ec_report_events_during_suspend(ec_dev);
 }
 
 /**
@@ -475,8 +475,9 @@ EXPORT_SYMBOL(cros_ec_resume_early);
  */
 int cros_ec_resume(struct cros_ec_device *ec_dev)
 {
-	cros_ec_enable_irq(ec_dev);
-	cros_ec_send_resume_event(ec_dev);
+	cros_ec_resume_early(ec_dev);
+	cros_ec_resume_complete(ec_dev);
+
 	return 0;
 }
 EXPORT_SYMBOL(cros_ec_resume);
-- 
2.44.0.769.g3c40516874-goog

