Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AD01AC8B9
	for <chrome-platform@lists.linux.dev>; Wed,  4 Dec 2024 10:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733309122; cv=none; b=A8w+icj1JpyA7Li5t24o8hcpDwMypmCxHKaNfXBgboqKIOIMZ5vN1eoncpb//0snsWUSZoDdWwP3+BVEKBaPKh6Ij5kbFs620lbb7HpHbIKRfloNlctmqG+s0ig5G2DFY/BaNjBlbfOZE/am48dCIIehTaWPB+24DeRCifxePM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733309122; c=relaxed/simple;
	bh=6ABzvr6unTAz8/XLgLI/eNk5SIQaJ8uqIkH12ItsGbo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=b8nPA4kodN0s4/RBWWYQv+QnFNgL6EZfyvws7fQsuoeqO1q9cFBRB077fNyYMruXBmBQX8i82+1EhvDcl+iLPTZ7lbHVFSxbXTJjhdL3subVMeSMZv+jygHcLmp3jsvDl3+XyCpoYTdJydJzKbfiblMK5B/ArhKV9AHvuRM3wQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dawidn.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gU9P8Z8G; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dawidn.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gU9P8Z8G"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-434a6483514so47327815e9.0
        for <chrome-platform@lists.linux.dev>; Wed, 04 Dec 2024 02:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733309119; x=1733913919; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=B3syshFz8xNToh+qn8VphOqjnxGVpP91fDVz4fAB19M=;
        b=gU9P8Z8G9RygpiGJaMbMRLxlnQm/DVhAwud/OwXwoZmhExvFyfsBtOSOfLkp4WpyDX
         DCI0qsNsf5lnqnDR3H0gf7/lPH4V30E6Fl/XHEzULA5rkXrtI5HeTHJHzodLl4qh+MI7
         1jsSBdLt34uhZO6T3oULMT/+ahIsWyjljJz5IJmFEQsZSFHaXbizetQkNt06fZy3Kvs6
         8epZvRzLz8Q095v8r3mgkJk/rTay5Y6b+laO69Sb9I8xko5T1cY13yCP0ChEGmLUNkZw
         PyNGIWvr5PqcA/e88qk5GqMfMopc+lHLcK/HaeGHrKRAUyl5fhzd/dCDuWMcHYRU8EYb
         inug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733309119; x=1733913919;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B3syshFz8xNToh+qn8VphOqjnxGVpP91fDVz4fAB19M=;
        b=SCw1GxRYGSZD4w4Zk3FH1vUABfkv0zqXW7qL6L8Yh5yumSvIgTNkiJN2et9tn9lLJA
         aBLQEu8JNtvmDugeLLVRB/fbwPg42FhmqOyIsWMsSEtdo35iIk0WdlFmeHP2405z39JM
         yqwGA+uuGRWtiUI5ttEBKm7cHwPOlJTl0zRN7ViZ4kMD+7idJ/b8wtzD8yKmW7gwSqx/
         VyFTTkCUm5JqNMsRNaJgSlcT1e9FzWBSdOCgZGZJZoXThVDDeky+beHJ/nXQ3vbS/ocy
         aiRocVTHdzZs9eHryUSsqCFzHWVvhTM7zvvDnTKBeHFnvUGunt+DiIlQb2n9onWzLpJg
         52zw==
X-Gm-Message-State: AOJu0Yz/WMqQ4JZZPOEUj/UEmhAKtGEFrHYc8x+0MZoUOrAQQA/DVvgM
	s3Drkx+JOT+OkbNMAaFprmMTN1HJGYRbugM9NFbYALcxhyIBzUMVnf4yvk8gbZsovLQzAXgnuyJ
	QAQ==
X-Google-Smtp-Source: AGHT+IHunP8FhVAqcbAxizHfk/ZUvf9lDejn99ybNwBIyZAYS1noMkvMq/IFx/7VnRvYK1UwBw4/MParSvQ=
X-Received: from wmba12.prod.google.com ([2002:a05:600c:6dcc:b0:434:9ed7:8b97])
 (user=dawidn job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3b8c:b0:434:a4bc:535b
 with SMTP id 5b1f17b1804b1-434d09bf66dmr50011475e9.11.1733309119162; Wed, 04
 Dec 2024 02:45:19 -0800 (PST)
Date: Wed,  4 Dec 2024 10:45:14 +0000
In-Reply-To: <20241204104514.1541964-1-dawidn@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241204104514.1541964-1-dawidn@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241204104514.1541964-2-dawidn@google.com>
Subject: [PATCH v2 2/2] platform/chrome: cros_ec_proto: remove unnecessary retries
From: Dawid Niedzwiecki <dawidn@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>, Benson Leung <bleung@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chromeos-krk-upstreaming@google.com, Dawid Niedzwiecki <dawidn@google.com>
Content-Type: text/plain; charset="UTF-8"

Remove the retry of the get protocol info command. It is not needed
anymore, because RWSIG continue command is send before start of the
probing. That assures the EC device is ready in RW and there is no
need to try again because FPMCU is not fully booted.

Signed-off-by: Dawid Niedzwiecki <dawidn@google.com>
---
 drivers/platform/chrome/cros_ec_proto.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index 9b451fac275d..2b90eed3a439 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -368,15 +368,6 @@ static int cros_ec_get_proto_info(struct cros_ec_device *ec_dev, int devidx)
 	msg->insize = sizeof(*info);
 
 	ret = cros_ec_send_command(ec_dev, msg);
-	/*
-	 * Send command once again when timeout occurred.
-	 * Fingerprint MCU (FPMCU) is restarted during system boot which
-	 * introduces small window in which FPMCU won't respond for any
-	 * messages sent by kernel. There is no need to wait before next
-	 * attempt because we waited at least EC_MSG_DEADLINE_MS.
-	 */
-	if (ret == -ETIMEDOUT)
-		ret = cros_ec_send_command(ec_dev, msg);
 
 	if (ret < 0) {
 		dev_dbg(ec_dev->dev,
-- 
2.47.0.338.g60cca15819-goog

