Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95CD26286
	for <chrome-platform@lists.linux.dev>; Thu, 25 Jul 2024 17:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721930240; cv=none; b=Hmsyykc162n3LqMf663Zf6EXP3qRKIYOyCFWLD/zPmjs3++18sK3hfuV7SeaZLwmJUmof0KqjT0rd2pcBi/mO+V57PqszhV94AAAb1t7iJDk/E4184DMjEXFeard5jDfFiEcVfP1QZ6jy5pVCERmFTV9iP4UOx0y9F4zxQ2E+28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721930240; c=relaxed/simple;
	bh=DhAIgWDpgwVkWBBmDYSxAnHbMgCM6/NvKYHcNXQNSYg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=DWbTDB8wF60FMYa/Y10kjmIW1/jq3K5hh2A/i/YttYQm6/I2e/qr6o7d/3J1DNGq8uDAv+ejcy+r71hMquyR9AQDZ954DtlQf4VOs4WB8UGMAhSmCKYOWOIjRbUhV8yxyhVlym6tvUNvvr4SsVsbCOkZMMbxOOZAPtRvpyT65fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--patrykd.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kCzh9vFN; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--patrykd.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kCzh9vFN"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-36863648335so758733f8f.0
        for <chrome-platform@lists.linux.dev>; Thu, 25 Jul 2024 10:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721930236; x=1722535036; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pj8wlsiwh+dQMB6deQXUuo6LHgenGkpoXoj1IjIi9wU=;
        b=kCzh9vFNltLB1rlJNtGeWnN2UsMqAPrq7OlR9sytQNK92DYTC26DOr9Op1dJCmYL9g
         rN9KDBKF29PyMzKwD2ASTtWpnSgvnhkDsL5B9zw4IBN5F3538HFvHT8UFp4tr4Ehs/z9
         MJ0WCwOy6t6jXjHG4FQeNt+tKHTVVL3ZKZWQyEQICHhuU3Fu2/L3rd5wCkF01EIMnwmU
         vnZexmQFB/OpAEL2j0aq2Xumyoc5veQ53svjihFPaSOa9LWFBuNL+eNl1tF597YDKkwQ
         H6XdQJwrTwzBgSzz21PKRWEbSQRbhnzJBzsSUe5DiSJTp6sBLEPrmZ7U/ClA3FPltTjU
         YU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721930236; x=1722535036;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pj8wlsiwh+dQMB6deQXUuo6LHgenGkpoXoj1IjIi9wU=;
        b=f44Ovm8pSN5hKhZDt9/T7jCzyaEAgPajos6zSLvj7XRsmnASkQs4uKJzUjHDq6/jP/
         lQcDSazxrDU197y0Fhg4OJMp/z+Wuc/gYAY2n9Qy+Juy9xv9gahgTRFKrTQzUQkI6qRw
         YkSDV+wk3s6MA0vyN76NS+eLbI/eCOL3rDV/0F4ypt+pTRxJp4uGzJrgxuYz/Qe7RuY/
         /Tev5MwREqfaX7rIyGACHbL6ENLMOtqkrWhsgOotXRhxCB4pQSb7BvUvoCIELy/M0R0A
         ig7ItFDnqo27XKk9UiyAzo4hQwxFmBwKgY3C2LhWWAk6scFZUHU6weKVufRrfXHI2ly8
         msaA==
X-Gm-Message-State: AOJu0YxJaLJMXTP6/8ZjwPjyeZkHZlK6prCxrN4GdUYk5b7hfRxWaab+
	hSHCxSS3ezYLe/Y9X/AM52qBknX10L53ePRP59Jf7yBr2bkxAnjP12W3TblDgRsbmN9Y2BE5iBH
	5XDg4rQ==
X-Google-Smtp-Source: AGHT+IGE7PmENKFcCopXZjvlj0vKRfEsY2GhFANwEWqXPK+LTdTXsK5o4971ia5IpQPiVH9ll7u1HZGHcBZT
X-Received: from lysy.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:de4])
 (user=patrykd job=sendgmr) by 2002:adf:f091:0:b0:368:3373:30bb with SMTP id
 ffacd0b85a97d-36b363c2f19mr4817f8f.6.1721930236012; Thu, 25 Jul 2024 10:57:16
 -0700 (PDT)
Date: Thu, 25 Jul 2024 17:57:13 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240725175714.1769080-1-patrykd@google.com>
Subject: [PATCH] platform/chrome: cros_ec_proto: Lock device when updating
 MKBP version
From: Patryk Duda <patrykd@google.com>
To: Guenter Roeck <groeck@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Benson Leung <bleung@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Patryk Duda <patrykd@google.com>
Content-Type: text/plain; charset="UTF-8"

The cros_ec_get_host_command_version_mask() function requires that the
caller must have ec_dev->lock mutex before calling it. This requirement
was not met and as a result it was possible that two commands were sent
to the device at the same time.

The problem was observed while using UART backend which doesn't use any
additional locks, unlike SPI backend which locks the controller until
response is received.

Fixes: f74c7557ed0d ("platform/chrome: cros_ec_proto: Update version on GET_NEXT_EVENT failure")
Cc: stable@vger.kernel.org
Signed-off-by: Patryk Duda <patrykd@google.com>
---
The f74c7557ed0d patch was tested with Fingerprint MCU (FPMCU) that uses
SPI to communicate with chipset. At that time, UART FPMCU had the same
version of GET_NEXT_EVENT command in RO and RW, so the MKBP version was
never updated in this case.

Version 3 of GET_NEXT_EVENT command was recently added to CrosEC. As a
result MKBP version is also updated when UART FPMCU is used which
exposed this problem.

Best regards,
Patryk

 drivers/platform/chrome/cros_ec_proto.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index f776fd42244f..cf7ef5f9db84 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -813,6 +813,7 @@ int cros_ec_get_next_event(struct cros_ec_device *ec_dev,
 	if (ret == -ENOPROTOOPT) {
 		dev_dbg(ec_dev->dev,
 			"GET_NEXT_EVENT returned invalid version error.\n");
+		mutex_lock(&ec_dev->lock);
 		ret = cros_ec_get_host_command_version_mask(ec_dev,
 							EC_CMD_GET_NEXT_EVENT,
 							&ver_mask);
@@ -829,6 +830,7 @@ int cros_ec_get_next_event(struct cros_ec_device *ec_dev,
 		ec_dev->mkbp_event_supported = fls(ver_mask);
 		dev_dbg(ec_dev->dev, "MKBP support version changed to %u\n",
 			ec_dev->mkbp_event_supported - 1);
+		mutex_unlock(&ec_dev->lock);
 
 		/* Try to get next event with new MKBP support version set. */
 		ret = get_next_event(ec_dev);
-- 
2.45.2.1089.g2a221341d9-goog

