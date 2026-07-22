Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024DF3D952B
	for <chrome-platform@lists.linux.dev>; Wed, 22 Jul 2026 19:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784749872; cv=none; b=IL4f4ZJmvWaZzUvU2ZFMgBB1gjn/l+b9zm/ge72s/Ob1sRogbhmA7ejJG9lu83MKUuBMasyznKgD1qI1Qmz+e/mP/O4SgwMOmUMi5Gr+YeNUAOyoRSV44RrCwOPZmRJCEkxs+ooT+muWz7jekU3MkGHkeB6cxpiQwHwHlhTCkAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784749872; c=relaxed/simple;
	bh=4jUCMdTQDiY8nnaNgKzeTR4BiuPclNDBdR4sa4EX4Vk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=jhNVrqTu6woreIjZOqD0sVQr/DYKm3nryjf4HannnVdsrPQzK4PZ9+0sFjRKrFvJTXR7bKVB7SvuI2aSqU7Vv87fCbrTa8SA45edK0poZw+cMFWQM/yRZ7jQs4c2xCIvn3uOyp+JvzXBv7pbdbpLGP73EOrJByfbY7dTkqSA9w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JdF+dTd4; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JdF+dTd4"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb7d6ba548eso5060932a12.1
        for <chrome-platform@lists.linux.dev>; Wed, 22 Jul 2026 12:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784749868; x=1785354668; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X8TW7+1XOyC8evaweToXtmQSrjCuUbN9HYIt2ES0cRE=;
        b=JdF+dTd4D4fc1Uo4HB0chFNBFsRFgXphQEhcZe6mlDs07Ee/a7uqYi0JORHDC7pEzX
         i6sTTx3WKac3ybuVGgwudY/YtB5g5H02OnXaOMyStIkK69jTAqxZsEz87tIePhRhHre3
         8+kp3WOLdpWCiZF4iNkPx4o8rwVFCgI6wTahs0kkv7JOlUiD94RttiVsVlNWhKdqXbdh
         xJtw0XcDAUoJR6FzpX98DcRt5mEVeN5sTc3ECW+xLWfONznKPXLWeWZRtopQAoYro2na
         x/2zMHk842csls51zPYW/IC5r6GE88O+YlnBZTZe8OdT4alo3puhcq9J/IVQbS2qwUef
         5AZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784749868; x=1785354668;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X8TW7+1XOyC8evaweToXtmQSrjCuUbN9HYIt2ES0cRE=;
        b=a3EJXSxiZp0++HNHSVsg0+eTz46+NJqGfDZHD+WI+fzUWyxjTqNRrcky+9qFZM50hX
         lzQCC7H0LW42LvX1fHn7HQVuBWedRMWsZ/QxhVN+E9kQ/9CeuXRnOE3NYHT6aYLtZYEd
         rpIvyBeVoJOuIoBsozQ1wMWS2wkJ9XtIri6t9TLfSOufoBMpIJYFy6EjJLIEvadHeGrZ
         Ygkp+xwt7N0eMI/yM+0klzgLINpLhny168mFxCgOJ+iMFGasMod3geBiT90q4VgY2buX
         TwJeJiddZrOZhNkqq7Srcp7TM1y+/7sG46O3LLyorCUCzJlFaZxCj7Hnwfb9bT2gDtds
         jdBw==
X-Forwarded-Encrypted: i=1; AHgh+RqiCCPJl+zHiWcVWWFK6eZqmsQoz8J13Zre3RLeYdEGzXkKwTOHJlOaJko+YqShage7+Xp7iM45a96zc31A0Pc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw25G2WpoW3AAehnxNLJ7TD1poshva1eDQdzLA8xDCWIJNU7hi4
	zOEXT0GJlkHJwv1LRz8plBV52XTT/KkstIZJl8xmbjghorMDXpO7sH8qiY6O374BFfTMwHk/1bP
	DHLwdKg==
X-Received: from dyng25.prod.google.com ([2002:a05:7300:7f19:b0:30c:2bdd:dcdf])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:9206:b0:3c3:9993:d5c3
 with SMTP id adf61e73a8af0-3c3ad665cdcmr27250375637.9.1784749868246; Wed, 22
 Jul 2026 12:51:08 -0700 (PDT)
Date: Wed, 22 Jul 2026 19:50:59 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Message-ID: <20260722195059.1420738-1-jthies@google.com>
Subject: [PATCH v1] power: supply: cros_usbpd: Limit port counts to EC_USB_PD_MAX_PORTS
From: Jameson Thies <jthies@google.com>
To: bleung@chromium.org, tzungbi@kernel.org
Cc: sre@kernel.org, fparent@baylibre.com, chrome-platform@lists.linux.dev, 
	linux-pm@vger.kernel.org, Jameson Thies <jthies@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Currently the cros_usbpd-charger driver probe iterates based on raw
charger port count returned by the embedded controller. The only check
is against the number of USB PD ports which the embedded controller
also defines. A malicious embedded controller could return an inaccurate
port count (up to 255) resulting in an out of bounds write and
subsequent memory corruption.

Update helper functions in cros_usbpd-charger to limit port counts to
EC_USB_PD_MAX_PORTS.

Fixes: 3af15cfacd1e ("power: supply: cros: add support for dedicated port")
Cc: stable@vger.kernel.org
Signed-off-by: Jameson Thies <jthies@google.com>
---
 drivers/power/supply/cros_usbpd-charger.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/power/supply/cros_usbpd-charger.c b/drivers/power/supply/cros_usbpd-charger.c
index 308e1d4e6dd8..82185ee33fd4 100644
--- a/drivers/power/supply/cros_usbpd-charger.c
+++ b/drivers/power/supply/cros_usbpd-charger.c
@@ -125,6 +125,11 @@ static int cros_usbpd_charger_get_num_ports(struct charger_data *charger)
 	if (ret < 0)
 		return ret;
 
+	if (resp.port_count > EC_USB_PD_MAX_PORTS) {
+		dev_warn(charger->dev, "Charge port count out of bounds\n");
+		return EC_USB_PD_MAX_PORTS;
+	}
+
 	return resp.port_count;
 }
 
@@ -138,6 +143,11 @@ static int cros_usbpd_charger_get_usbpd_num_ports(struct charger_data *charger)
 	if (ret < 0)
 		return ret;
 
+	if (resp.num_ports > EC_USB_PD_MAX_PORTS) {
+		dev_warn(charger->dev, "USB PD port count out of bounds\n");
+		return EC_USB_PD_MAX_PORTS;
+	}
+
 	return resp.num_ports;
 }
 

base-commit: 17376e7311cdec252b61cb1ecec43be61907781b
-- 
2.55.0.229.g6434b31f56-goog

