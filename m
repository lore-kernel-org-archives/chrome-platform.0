Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A911482F5
	for <chrome-platform@lists.linux.dev>; Tue,  4 Feb 2025 02:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738637173; cv=none; b=EwYSTOly3/1E3kHp/8ysdMQe5zq0wkEjFMVwGfV9LS7pK2nTaZtrrkiS/tZ48uvAGL3MO4+qkJXdfYh9IXP9GYTNBrKQfGpYQU2/b+BCfspP14WrVGWooue7WaIUckdUggg3Q3k+nVtkpYJJ/VPnVfWTB6qz/yPH7qabtaspSW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738637173; c=relaxed/simple;
	bh=FhlvvrwLx13f9HUXfcFDQ70gZZkNz8MovH5kLuSeCkM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ct43xV8MYO6MNUDMw3SBAOmCdzCAPY0ZX2rpdH/yMds6J93jIw+qSoB98eAUgI7gDv2Rknbw6rxLiwtn8iiReomCXkifd2wRoLhHrCb1N6yg7HvtLeZzZTysqhGytVBl3q+AUZYVYdlxVouKWwgnj7TcQFOroF0IfUj+9tVTe1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0BEoEGTw; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0BEoEGTw"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-21f075a828bso664335ad.2
        for <chrome-platform@lists.linux.dev>; Mon, 03 Feb 2025 18:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738637171; x=1739241971; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yj6PYh7a5V+2YmsXleNKK2uqpxAMcmSNOValgCGwzic=;
        b=0BEoEGTwRbibnKA/CmL2wuKz4K/KlLMkdNmwOnosyt9uwUD0IlW/cxx8xFvoJIsBwc
         UfYWZ323BogzrSDvm0uz+zlmB+9h37+jm0tIA/mvx3Q8iQH1pzcDYFPg9Ag9h4cHDL+e
         p1vy2LFNe1EXTsp0JW/V2NoVg3d2CKNpAPlwDhbQp5eWNXGV9aY982vI5eryuUtzLFP0
         QwJQ4HA8Zz5nfO2D29/ZtZ6YQyNxljctufgHN9uxYodY3J+ZlHXhycuvhkh3EEGTRokN
         kM0ghGh5qKuZOJwgZuvKTjNY+/JTw30mMF6UIr3ZrImvrK0Nmt+YlzqHyc4DrnS5PUAw
         kMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738637171; x=1739241971;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yj6PYh7a5V+2YmsXleNKK2uqpxAMcmSNOValgCGwzic=;
        b=Sp5nmvCGlzIm2KKpgGYtcAXfpzJ+hJkXZkcYeKoNXtvFIVPPSvysoka7O2nkCzrMxf
         pa+/9qUKA3fqaPHAgg4DyHNsmToUYJPkLVwQDwHI7qtRVAoJ2jXaB03l89RiwaX5HrQc
         ZKvyKe2DE2kNTQQzvFprk/8wtQbwTxm3iBGHRQJR9eaxERJ7gZbw4dTSWOWsA7+LLSvx
         CXg418r7z4cNHn3Ij9c5wYqUZnZ5eEKvnsKgtDH2doM4HWLGr5C7KinRpcQxLhUxG0a7
         CAg2/Aqo/MIKQblb0AlnJqNI+f41TYMiJy+e+85q4PGUgPOW9jeLe1pcABUcQUozhtTj
         ilMw==
X-Forwarded-Encrypted: i=1; AJvYcCUhC+hCW3EFVF79bc4/bIf4jm6BdxBypDK1yhgwUJ4RRH4Bvhzlps5/aRQD4RZ+OiroOgrkGQLpO6LSNSckQo0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwEiFDyM7hHrgcfEsLoOhhD52uUkmKu8o73HAmiJpoSfLIGGg6O
	P8XVWJWOMrugAIoYyVuKg/NZx4+ELVCVuOkcILLut3+ciYfyV+65y8qQUvNTnl6DNR0DbetYnM3
	r1g==
X-Google-Smtp-Source: AGHT+IEn7QjqULPLggNcfCVd5kG+YjRhCMLFnv6RORNu9jV0K0dUDdgMxSFqNkRCyU2XpgiPsBSpbdeAIlU=
X-Received: from pfnj23.prod.google.com ([2002:aa7:83d7:0:b0:725:d8bc:33e1])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:d04e:b0:1d9:c64a:9f72
 with SMTP id adf61e73a8af0-1ed7a5b68cemr45332792637.2.1738637170795; Mon, 03
 Feb 2025 18:46:10 -0800 (PST)
Date: Tue,  4 Feb 2025 02:45:59 +0000
In-Reply-To: <20250204024600.4138776-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250204024600.4138776-1-jthies@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250204024600.4138776-3-jthies@google.com>
Subject: [PATCH v1 2/2] usb: typec: ucsi: resume work after EC init
From: Jameson Thies <jthies@google.com>
To: ukaszb@chromium.org, tzungbi@kernel.org, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Cc: bleung@chromium.org, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org, dmitry.baryshkov@linaro.org, 
	abhishekpandit@chromium.org, akuchynski@chromium.org, 
	Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"

A manual EC sysjump will restart the PPM and break communication with
the UCSI driver by disabling notifications in the initial PPM state.
Update cros_ec_ucsi to listen for PPM init events and treat them as a
system resume to re-establish communication with the PPM (ChromeOS EC).

Signed-off-by: Jameson Thies <jthies@google.com>
---
 drivers/usb/typec/ucsi/cros_ec_ucsi.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
index c605c8616726..5f17fcbda059 100644
--- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
+++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
@@ -205,12 +205,19 @@ static int cros_ucsi_event(struct notifier_block *nb,
 {
 	struct cros_ucsi_data *udata = container_of(nb, struct cros_ucsi_data, nb);
 
-	if (!(host_event & PD_EVENT_PPM))
-		return NOTIFY_OK;
+	if (host_event & PD_EVENT_INIT) {
+		/* Late init event received from ChromeOS EC. Treat this as a
+		 * system resume to re-enable communication with the PPM.
+		 */
+		dev_dbg(udata->dev, "Late PD init received\n");
+		ucsi_resume(udata->ucsi);
+	}
 
-	dev_dbg(udata->dev, "UCSI notification received\n");
-	flush_work(&udata->work);
-	schedule_work(&udata->work);
+	if (host_event & PD_EVENT_PPM) {
+		dev_dbg(udata->dev, "UCSI notification received\n");
+		flush_work(&udata->work);
+		schedule_work(&udata->work);
+	}
 
 	return NOTIFY_OK;
 }
-- 
2.48.1.362.g079036d154-goog

