Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793687342;
	b=Gv9i+tN4CSP4WCA/5pZpG0rVFsSSPBp7wQbLKEAbn9o3Vu0PtZ0YmXK9+Hedq9dHrLWI
	 MPa4N4QmWCa7yDKTykZtooXq3NQb8Uo6oQETE0Nuk5ZGom5XZVvZgprs0uFG5XNK2l8Ac
	 zWp6b+dAIESSSIY8cx8vqtT0C9BFTr6s/XCEghOETUSQSQc3zzUeYJngC1oOzxovxOaXw
	 ae/Yyc1tifNj5RN9nvviS0JrIsdwdJReQ1H2awYbiVPec5dDmq1eyhCBM/hKTFjQ8GCe6
	 WbwrvC0Cf4/pQk1JE0f7cDQrmdYect4rmVsu0oMwIdttLJMw10DMqZyBVFBTo7N6FuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793687342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=kPjMT+SFzLPVRdUodSrgDaoLXCme21lrWUEOuuTeAiE=;
	b=nKkG7xQ7dSmKFgJifQaNN4NtRv/G3Br60undevxR85bY4Ex6TU1VoBmL9cMnJ6nKDDaP
	 WWn/Hc2sg+1jCfrx7o/PgmYQfE2ZelL0F8mUc5QlR/uruguVPgiu1/u9yoZZrUkQ+YqL/
	 7NMCLn5msEcgPX7KD8UQW/+r1t7Di4JEqcsPM4HldxGPJgyXBwgJNeV8Z6W6FnFmGeSFw
	 a0ZcANvD2OM8egWXPQw9C1rO6dVEhoS7Sah9/0QssIdUrdX4CJUb/S6IeoIYhh1q3SPBP
	 pZM3aPNh+CeC/B4BguBaKZhI5xmtPbKkK9xhWy+bM7M9XdtmGyBnaqIP/7aXHEt2MfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--cyueh.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bJcKUp1V;
	arc=none smtp.remote-ip=209.85.215.200
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EA2606A330
	for <chrome-platform@lists.linux.dev>; Tue,  3 Nov 2026 06:29:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0EA2606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--cyueh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bJcKUp1V
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdae1584747so1793961a12.0
        for <chrome-platform@lists.linux.dev>; Mon, 02 Nov 2026 22:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793687341; x=1794292141; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kPjMT+SFzLPVRdUodSrgDaoLXCme21lrWUEOuuTeAiE=;
        b=bJcKUp1VWP5U4dxSu5PwL0FjsU/PjgS7N4Vs/1YA0YSzVSEz5fhF0h/QoTk8WMTBif
         4L4Nx13o2nD0+fkkvdtPHEnO+4m5LlRwh6j6IWpjiKrGrcztcI54HdWmRwWM75PiSOfs
         gEpAmHYTFuk5jMxgD1zozldm5oDKMmJuN+WZ49gIjyvz54JQ3Xz7vIOANcm5Dhlj2qas
         zn6NO0jQ8DfL93fe9dMd8XXfrkzFq/rpMpM88sHvy/eOvq9oaEUmCXqqSmJuzKy5ufai
         yNU348KhMp9bPmesHhY1CK/GuBDLd+r3mAqYlwe5e7GSF2H3Tn7GKh549LMpmKlbfHA7
         qysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793687341; x=1794292141;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kPjMT+SFzLPVRdUodSrgDaoLXCme21lrWUEOuuTeAiE=;
        b=KqaJZPlvalgM2P3gqyYK75/qBga5RylHFlDPk2iVSLW9Aoe2AIYS32E+SDFHDcrsqN
         3gRMSgnkXn8ad/2tDrtmTsZq9Yn9PAF6HCh/eiUU+RfIqoGiwMbByfQ1h/x8R5qYGPjB
         3KLlVFc3JTnqkdbP2BytinZlchEWk3kvKtEkqU+goo4EKf4WyhazPDtyIvBYeAZHm5yi
         OSqjvfTu9SvwmjXuiB3y/t4bYRT+kGu8u6ETm+gMtP1hJS7s+TVK2ZANLdD0H8cakDFf
         +cWK3IreWqgML6/oS8CJdJze/EC866nNsG87OOPVJ0nMxCsdKZ37dth6ulg1HXyQu6SC
         fIsg==
X-Forwarded-Encrypted: i=1; AKwUvBwSRfpcmDud2yW8+xdc6rkThdWCXUcEk6atiXr3zi8rS0xjFZEESp5vXsSLARgGfzQ0elXi5NhQihUDmf3hw/s=@lists.linux.dev
X-Gm-Message-State: APuU4Z/rHdC7ALtYQ/Lgfw+EXmG0cORHJoo1YOCNTqGltaMspWwIQxMs
	TJ/6aMhDU6C62QF12hCo3aEmQxHLYAIWnThsUFyiod9ExL3G6icwyf5uxZDAX7qJS5TvrvnhsyM
	SOA==
X-Received: from pfbgq25.prod.google.com ([2002:a05:6a00:3bd9:b0:89f:4f8e:282d])
 (user=cyueh job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:a510:b0:3e2:257a:a61f
 with SMTP id adf61e73a8af0-3e928fbdc2dmr9948243637.59.1793687340722; Mon, 02
 Nov 2026 22:29:00 -0800 (PST)
Date: Tue,  3 Nov 2026 14:28:02 +0800
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103062802.361878-1-cyueh@google.com>
Subject: [PATCH] platform/chrome: cros_ec_rpmsg: record last_event_time on
 host event
From: Cheng Yueh <cyueh@google.com>
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Cheng Yueh <cyueh@google.com>
Content-Type: text/plain; charset="UTF-8"

Transports with a dedicated interrupt line (ec_dev->irq > 0, such as SPI
and I2C) record ec_dev->last_event_time in the top-half
cros_ec_irq_handler(), while transports without one (ec_dev->irq == 0,
such as LPC in cros_ec_lpc_acpi_notify() and ISHTP in ish_event_cb())
record it in their respective event callbacks.

cros_ec_rpmsg also operates with ec_dev->irq == 0: when an MKBP event
notification (HOST_EVENT_MARK) arrives in cros_ec_rpmsg_callback(), it
schedules host_event_work to invoke the bottom-half cros_ec_irq_thread()
directly, bypassing cros_ec_irq_handler() and leaving
ec_dev->last_event_time as 0.

cros_ec_sensorhub_ring relies on ec_dev->last_event_time (via
fifo_timestamp) as the AP CLOCK_BOOTTIME reference timestamp to calibrate
the offset and clock drift between the remote processor's local hardware
timer and the AP timebase. Without this calibration, IIO sensor sample
timestamps cannot be synchronized to CLOCK_BOOTTIME
(SystemClock.elapsedRealtimeNanos()), failing the Android CTS sensor
specification TimestampClockSourceVerification.

Record ec_dev->last_event_time = cros_ec_get_time_ns() upon receiving
HOST_EVENT_MARK in cros_ec_rpmsg_callback(), matching the other ChromeOS
EC transport drivers.

Fixes: 2de89fd98958 ("platform/chrome: cros_ec: Add EC host command support using rpmsg")
Signed-off-by: Cheng Yueh <cyueh@google.com>
---
 drivers/platform/chrome/cros_ec_rpmsg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_rpmsg.c b/drivers/platform/chrome/cros_ec_rpmsg.c
index 39d3b50a7c09..07b9e71ac8e3 100644
--- a/drivers/platform/chrome/cros_ec_rpmsg.c
+++ b/drivers/platform/chrome/cros_ec_rpmsg.c
@@ -180,6 +180,7 @@ static int cros_ec_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
 		memcpy(ec_dev->din, resp->data, len);
 		complete(&ec_rpmsg->xfer_ack);
 	} else if (resp->type == HOST_EVENT_MARK) {
+		ec_dev->last_event_time = cros_ec_get_time_ns();
 		/*
 		 * If the host event is sent before cros_ec_register is
 		 * finished, queue the host event.
-- 
2.56.0.385.gac671c819a-goog

