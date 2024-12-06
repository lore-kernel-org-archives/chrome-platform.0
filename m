Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D86C1EC01B
	for <chrome-platform@lists.linux.dev>; Fri,  6 Dec 2024 09:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733476523; cv=none; b=sqwx5eePr2l471znc5zNXf9oCMkqoolzhvdztxqpGGYioyf3r7fdFDHfZEiNpn3ySYykUQOyV5qPQjLo/ELtAvyb4AZlxJcTYtGnNcmsqJ4d7CGguE4kIDgBNPOR1TW+x/HOgaIdv/S+tl8DZ598TD4KZuv7ZduwP9IyU4Gy0hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733476523; c=relaxed/simple;
	bh=MYzwUtFpbWL9r6VYxqXwzVKHwi1Bcmepx+5EUyvVXBQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FkqvJipvv6+ugleHNWgfvAhFNHKaOPxDaShYtfvtbg3THjoIEZCaATBgAIcJpXgx2S7HDW0rOAHPrmakK/fX+RGofnOjx2SShFamiLqw92o0v3JTsFgP+EmZR9zpLgxoqIXoohU5OgDIKHH50KLwREg57KUpm67epxMXXnQkFLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dawidn.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ynYaM2uJ; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dawidn.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ynYaM2uJ"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-434a96889baso11081975e9.2
        for <chrome-platform@lists.linux.dev>; Fri, 06 Dec 2024 01:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733476520; x=1734081320; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=l+JZ3feBgmuGJFJUNDda/aWNqtr6PNOEfgO0nNPTEuQ=;
        b=ynYaM2uJEkAYMar7gBC2xkOeaHEoSV6j+NRpGeJbRZeEmpC/qKqgTJq3OyJwnAIkcZ
         rrt0w8/eLfEwEqe/Lw6ijaIorEqBvBjwc7nr5ZPRb0PTYqUPG6scEfUj1okzcCDHIxuw
         YtNxbjZp0a3ff1Auiud3kbfDIIInP0JGt+w1IN70jPBGAc8DcPRMHv+Tmqa3ibvRmdOb
         pTEtuX6tGHHbsH6fVeAoHvAZ4Zl8sZfFBIkzf6N+n+gBTLIugone2Pcp7fb5s026VupE
         7B+qWQsDVlV+wV1Wg11KUN46qUs8Irll/13yep3jX0GtwNJ3GC+TE0d/Xdt/C+0G8yhU
         2JOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733476520; x=1734081320;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l+JZ3feBgmuGJFJUNDda/aWNqtr6PNOEfgO0nNPTEuQ=;
        b=h1/OHs/9n6nEC9ZIYfJfEHuBM4se0NKmhU++FyexKLKqX+Jbc9mg2FERPx4mvc6ODp
         WkK6RWMj7eO1cVNRunnF84skku0aRnQzCDdbHxxL5bYVv2zGeLa+VMpVyUAT/wDpAEhw
         F8vzz7m/B/rp6fOCBmgnfcjjWBup8HVojoHjGTnw2jUBtT4CpPBR8grt6LinR9xxSqfw
         bMUh6sbuND9QQPskGfNEPFkTzbfLPnx9moIKWvcnY/8hevS+LHpHYP+F5noqk1XApvts
         yZgFFjSNbmIsi8Qxte6V8LiFhEp4I91mhR3ZK48AGIs+cxJLFzzB6sgU8pRi8kmIbJZd
         Wc1A==
X-Gm-Message-State: AOJu0Ywyc2AOXCvki7CU0JLP/L+Z9yod+GtRGHwPguw6SFMxX6dwClv1
	+3AXA54bP6ZgIJ7c0/wbooxyG0nnCz8rvJanE0HM0zAXmNovfJx4gi/4IfxnHSHdhifhdlJU2b6
	Bmg==
X-Google-Smtp-Source: AGHT+IGvlgmSL41HUWBgAW5WsyYxVW4mjk2MZubNbT5HwXXppbgMYzun6U3vqW3i+ksER3v8bc0vGgNRHIk=
X-Received: from wmil25.prod.google.com ([2002:a7b:c459:0:b0:434:a152:3ce1])
 (user=dawidn job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3488:b0:431:5187:28dd
 with SMTP id 5b1f17b1804b1-434ddedd684mr14502025e9.28.1733476520171; Fri, 06
 Dec 2024 01:15:20 -0800 (PST)
Date: Fri,  6 Dec 2024 09:15:14 +0000
In-Reply-To: <20241206091514.2538350-1-dawidn@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241206091514.2538350-1-dawidn@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241206091514.2538350-3-dawidn@google.com>
Subject: [PATCH v3 2/2] platform/chrome: cros_ec_proto: remove unnecessary retries
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
index ed3623b54bc3..877b107fee4b 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -366,15 +366,6 @@ static int cros_ec_get_proto_info(struct cros_ec_device *ec_dev, int devidx)
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

