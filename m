Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8E71420D0
	for <chrome-platform@lists.linux.dev>; Mon, 29 Jul 2024 13:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722260049; cv=none; b=ta2jJN+yPZD4+OiBKJ3WatxTwVarGbwUqTxK7SsMyqwlCca8GgC8m7+bXyPKi4mhGTWx1xuGQ2mjw9ayAjpD7G35UqGKjvIBw+IOtcbl35lnBc0PjFTUW/Lr62NA88nuBnR54QWjzCpssRC3JzxDbPqQBC2si0wIAT75B9CHFp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722260049; c=relaxed/simple;
	bh=w12nwxUIREwYIPXpg/GTvCcfWPETkevslajpYZZtTuQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=JbC/rzVNGV6w0ZSbevRqzSjLWTJFzBNeAxr8dDksAtDcoEdsGYXs0yCSgVGv0Du35OHE2XtEho2nwQoKw5Rt1TrKq6xIM++WLiTEl7qfHrG7TR1QRW2URmzinnm5Qf3YD9UQCCB0zweh7dD5V6rU4tKlWov6pyyO8CSRn+y46Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--patrykd.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aJDB/9te; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--patrykd.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aJDB/9te"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-36857dd6913so1340359f8f.2
        for <chrome-platform@lists.linux.dev>; Mon, 29 Jul 2024 06:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722260046; x=1722864846; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=465ZBROIKLCLkrN/lLvUWM4F6rNUZr8UWVo8sKBdyEs=;
        b=aJDB/9te0wN3+teCjjVsQl+Vdrh8tFnLwizE9kXJ2Zllr3TbSDa0jXU4tcIm4hOYIs
         aW56nKLMCSVVI+fmUIvD0k8KYkusvCy+Pzb7fOm/rCaAsFzOxuH8jF6TmX8lfn+GeDpe
         67gJgRPr4deBlNox05oJy6rUsSYq+qsfBw9C9Qz8h1KpPmvpsKyMHfLulJr+NSxKdm1t
         e/6Kjt8DNLwNL12fCEQEEBI9rk/ruJA+7fQcgzTySfqA4W18F3VMyr3S+jJE80kQa8MJ
         5jZN74am4qZwPTR/xbSk6V8ELOcOUgDrxjweAnHsP9zoIbrz1BCXROBdwiVZYex6st74
         uITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722260046; x=1722864846;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=465ZBROIKLCLkrN/lLvUWM4F6rNUZr8UWVo8sKBdyEs=;
        b=GaWLJWVmlO8GfdSWUx2hOOsGFY4kBhdGSXFU4gVGNtxbqu6Vl8NWHRPkSNEiHtdc1k
         rJYhutLHzRG1ZSUeXTbeXxa4l8q/xdV7LlP0zGUgVKMUxsBr5CZPWVFnF1F3mJwyeLdN
         lZ+izcnruLND1cFT+k+OTmWyuIYf5NKMqDheNsEqEmfuyp3xvHGqmwx9LrBvaLhd3tCa
         wLfRzRE/Ybq17l8zdAdVBDeHTfzkQ4afp4LZ/rLo+wwGC/aUCqgWWHb+UBzGj9aReR/f
         jWro89WluCreVnMpFNASMmwuJC3FRnxnNspTiMvSh0RCCE3l215KtHyCDGKcy61xuHOS
         Pp9g==
X-Gm-Message-State: AOJu0YwNkXQZtMjfEUmVQLqLBtqepHZfJDEC0PJbhTnUbG8zYm5Gh28p
	KgrpozPduITkeqFstVgl0h7o9HQ3QzrKVwuKa5QNdfluYPXuE64SCAK7hYIJVR9a4mYAcVNjHai
	MRpJV7g==
X-Google-Smtp-Source: AGHT+IF9rOb7pQOtFCNoiOZzLDJokFhreMRyBjy14aQy0ThNkcmbqxR6nWbsT6OH2KVHsm0kUsmqNSNe5nSj
X-Received: from lysy.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:de4])
 (user=patrykd job=sendgmr) by 2002:a5d:5267:0:b0:368:3ee5:e3d9 with SMTP id
 ffacd0b85a97d-36b5d352629mr11284f8f.4.1722260046110; Mon, 29 Jul 2024
 06:34:06 -0700 (PDT)
Date: Mon, 29 Jul 2024 13:34:04 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240729133404.451210-1-patrykd@google.com>
Subject: [PATCH v2] platform/chrome: cros_ec_proto: Lock device when updating
 MKBP version
From: Patryk Duda <patrykd@google.com>
To: Guenter Roeck <groeck@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Benson Leung <bleung@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chromeos-krk-upstreaming@google.com, Patryk Duda <patrykd@google.com>
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

V1 -> V2
- Added missing mutex_unlock() on
  cros_ec_get_host_command_version_mask() failure

 drivers/platform/chrome/cros_ec_proto.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index f776fd42244f..f278fde15504 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -813,10 +813,11 @@ int cros_ec_get_next_event(struct cros_ec_device *ec_dev,
 	if (ret == -ENOPROTOOPT) {
 		dev_dbg(ec_dev->dev,
 			"GET_NEXT_EVENT returned invalid version error.\n");
+		mutex_lock(&ec_dev->lock);
 		ret = cros_ec_get_host_command_version_mask(ec_dev,
 							EC_CMD_GET_NEXT_EVENT,
 							&ver_mask);
-		if (ret < 0 || ver_mask == 0)
+		if (ret < 0 || ver_mask == 0) {
 			/*
 			 * Do not change the MKBP supported version if we can't
 			 * obtain supported version correctly. Please note that
@@ -824,11 +825,14 @@ int cros_ec_get_next_event(struct cros_ec_device *ec_dev,
 			 * EC_RES_INVALID_VERSION which means that the command
 			 * is present.
 			 */
+			mutex_unlock(&ec_dev->lock);
 			return -ENOPROTOOPT;
+		}
 
 		ec_dev->mkbp_event_supported = fls(ver_mask);
 		dev_dbg(ec_dev->dev, "MKBP support version changed to %u\n",
 			ec_dev->mkbp_event_supported - 1);
+		mutex_unlock(&ec_dev->lock);
 
 		/* Try to get next event with new MKBP support version set. */
 		ret = get_next_event(ec_dev);
-- 
2.46.0.rc1.232.g9752f9e123-goog

