Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793993527;
	b=p9lTutcJUMnahcnBdl1O3p18+0qFu6wr00iStDRTCwVx6tC2T2vYyEPZ95HhbHgc8oQf
	 AYmZz5N/7Zkkuw74DW8y+Pnj1+GjmS6/yf6Qp9ylZrEootAx5q9cG8r4fP0ygk5KxRCfi
	 m1jzRalpTYD2cblmDcEo0c1C21gEv5RbmMhCUPtEhkuXnmLoj2Ub1QWYou7rDvwsY+xEL
	 aqoSOxTDG6jujjuAcGt8xwioz+N0wBPM0w38Gv++lBk1CFtuHhDAoapNWKD7Gp5tJDOzl
	 FdrSKWmXDaxxfXUppmT+CsIYby9HNGTP30H2wFz9D+Pl2hVp7iWO/jDUjqIpBq7MWKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793993527;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Iw0r9KyM9yE8+UHLOBvRU3eF9rfoOEr06pAaRlmDbAI=;
	b=Jaccbeg1zE6cyVjE5fkF47aT3ixNTCa66M0LT9V/KIs20gRES2Zqodrp3/ymEUneg2ND
	 Ud7yn3oH4awBVqv1f2amzxGQXA1IhKfbMtdZ7nt65UKj8xzqN0S601cc15yuPe1fm0aI4
	 kJj8NjrZ06trKqjviZrKQR/v4g8LDIwmrH5pBcPNKKUkbW9buOGmsvPOAQUrPwTpzXThX
	 jpM87i+mAjf1RogZsfzdyQ+MFA+rb6p6W107jiDU9FUTqoBurmJkAa9e/tb/GlOpQyfyU
	 CID3ty4zNHORQKncoyese1/3Aif/J/+MP1AgDbTkE044cYRkwT2m2xsN2piL0MuOQ0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dbalint.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A2trcZs9;
	arc=none smtp.remote-ip=209.85.208.200
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C551A606A326
	for <chrome-platform@lists.linux.dev>; Fri,  6 Nov 2026 19:32:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C551A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dbalint.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A2trcZs9
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-3ab3089df39so4054371fa.0
        for <chrome-platform@lists.linux.dev>; Fri, 06 Nov 2026 11:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793993525; x=1794598325; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Iw0r9KyM9yE8+UHLOBvRU3eF9rfoOEr06pAaRlmDbAI=;
        b=A2trcZs9Pl261P8hk1rdZPojDfxc2BFPx2dyFo05fhOsKn+e5LSvmc9xbgyhJi0bE2
         poGA3kCGxvQax2JyUA/9s+dh9F4WAj/CbFkRHZE4JP8+SC1Hoyc2fy8s3ZxB8uDnmnMi
         iTZRt+yZZDr0WkYNHTGkz48eia7y8Npwem2uzFEA9WsPwsVrbRAJJh3h3qtU6FGd1uzG
         H672JawNRbHqcX9FE53qYqNV1RzuEfMIH3D9RlbIkfvuY7dt+0kn87MzUFK0EIPPn3vi
         0RidQyBIEkssAUXEMmuIydQ65pgHZ+vB76iRy+9ef7+V6eNklre5Ql8IFVtza7fXkK3i
         Jbjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793993525; x=1794598325;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iw0r9KyM9yE8+UHLOBvRU3eF9rfoOEr06pAaRlmDbAI=;
        b=DXse18UN7qNg72zgfil0+pJELn4xxZ6JC19FuiF1MYVb5f7E9AYZcYgHOR/eqSV1Cr
         S4t1Rmv7aOZ2Q+XLIw4yigCkT61TyXJZNa8pMzhmm7xMXN7PEy0BePe9DhhbXaqXKSqX
         W0Yj7ipol7n21Vc1TFmIyU5t5bQeDbFyb+zoUFdTfgR00dV2eQgDwf5eZ1DDNbo+fHVN
         9PWVyd6eKa3bN/GEFRJOgpItnDyh2/QPZfaYMWAiN0oW3u936BJTKB0JccScH+5d0Mbh
         EzutHltoD/WoPrtS2hMF9aZd9Nco7MHLTPj6dfmHQKSJWeUZqIw7hAv5to8lnA0kHG9k
         poCg==
X-Forwarded-Encrypted: i=1; AL+hErG5G9EySH56Z0/yyVx+YT6kSJj681dYKbWMhuaaq9XMs7JLsSQTqIuqJQZsIikBtVL+fn9FmZnAWnWiWC7jdr4=@lists.linux.dev
X-Gm-Message-State: APuU4Z/20Q8OYRDlsNJeYYvtb5cdEcQsFuQ9IjDOCBFOgDkQSnwWQ1fv
	jznCPwbmQvFrew7Sb3iRHxGN1wvWJHQXST2SSWSjTpNtdQJAMGa7ESs53muw8UCRnzeQSyRC60b
	ntQ6F9EGLXw==
X-Received: from ljgi21.prod.google.com ([2002:a2e:8095:0:b0:3ac:f040:c4e9])
 (user=dbalint job=prod-delivery.src-stubby-dispatcher) by 2002:a05:651c:31d1:b0:3a9:7e4d:7fc5
 with SMTP id 38308e7fff4ca-3acf3b2f8cemr7731911fa.18.1793993524757; Fri, 06
 Nov 2026 11:32:04 -0800 (PST)
Date: Fri,  6 Nov 2026 19:31:14 +0000
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106193129.43493-1-dbalint@google.com>
Subject: [PATCH v1 0/3] Introduce cros_ec power monitoring
From: Daniel Balint <dbalint@google.com>
To: Jonathan Cameron <jic23@kernel.org>, Benson Leung <bleung@chromium.org>, Lee Jones <lee@kernel.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-iio@vger.kernel.org, chrome-platform@lists.linux.dev, 
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Daniel Balint <dbalint@google.com>
Content-Type: text/plain; charset="UTF-8"

This series adds the ChromeOS EC On-Device Power Monitoring 
(cros_ec_pwrmon) driver to read onboard power-monitoring ADCs,
such as PAC194x, wired through the embedded controller (EC).

Several ChromeOS platforms are equipped with onboard ADCs that are
connected to the EC via I2C bus. The driver interfaces with the EC
via the existing EC_CMD_PWRMON host command API (and EC_MKBP_EVENT_PWRMON
events) to manage ADC accumulation and expose accumulated per-rail energy
through an IIO sysfs attribute.

The driver is only loaded when the underlying hardware feature is present.
The series also fixes alignment padding in EC_CMD_PWRMON definitions.

Daniel Balint (3):
  platform/chrome: cros_ec: fix alignment of ec_params_pwrmon
  iio: adc: add cros_ec_pwrmon driver
  mfd: cros_ec: load cros_ec_pwrmon on supported ECs

 .../ABI/testing/sysfs-bus-iio-cros-ec         |  13 +
 MAINTAINERS                                   |   7 +
 drivers/iio/adc/Kconfig                       |  11 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/cros_ec_pwrmon.c              | 333 ++++++++++++++++++
 drivers/mfd/cros_ec_dev.c                     |   9 +
 .../linux/platform_data/cros_ec_commands.h    |   2 +
 7 files changed, 376 insertions(+)
 create mode 100644 drivers/iio/adc/cros_ec_pwrmon.c


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0.455.g6c5a503b38-goog

