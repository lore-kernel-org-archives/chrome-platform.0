Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72C415667D
	for <chrome-platform@lists.linux.dev>; Mon, 18 Nov 2024 09:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731922445; cv=none; b=c2tdIfHBEs24tvst0il8+wU2jD3fQy9V48KeVnDwh0BQq77qHgWHdTeDGljDcnRYi3BJorBu6kShczddlnI8pCOfKP57VIw9FFGX1Ssy6CXkJWNK518Cf9HQvKUjfrU+OT95H/O1apHJ2t8SnPe0BSX+5HOWYVz/4axJWLCfoBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731922445; c=relaxed/simple;
	bh=mgpxk1Id3EynGOXNWYWN8QXCMTV4djO5BklM9jOek1k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jyKc5l9/Iiau2C9NkEIv5ZshRs6DF6nZ7vmNp5keBSl3A0PC4GccUb86/83AFdRFe32+JoYevWjg4/oFA8MUgRBKbb0oh4ml5RM+hkbzJGNnKrWgFg0psTl4UddBu7ezlOI9RivkvE8fSVHOQ/417WbaJnYUKYnQSRlwcSb9DkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NaWLKrxU; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NaWLKrxU"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7fb632bfc0eso1001882a12.0
        for <chrome-platform@lists.linux.dev>; Mon, 18 Nov 2024 01:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731922443; x=1732527243; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HO5WwwJBXKRwY38AXn2v73LeqlUfbbIi5JSituwuRLU=;
        b=NaWLKrxUcLyCKzZMvk/t1vteUjpOw7ymrqZ4xy8ntBTLL2K3xXROP3d+ZDiijDqH2V
         fma1Rx8EgZ0ZSsmv1aWY35DDMUmUgSFiqORP/OFCVqveXxd6qjY/RY0f/hGTTejPowJk
         LHe84w/bDU318cv5OHZJ9U9UHtUm5L36Et8Xw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731922443; x=1732527243;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HO5WwwJBXKRwY38AXn2v73LeqlUfbbIi5JSituwuRLU=;
        b=NuKSon59tJ3JjnnuM+HgR/cBTiQ98kpjinwm+4T0iqbdIIbUz84BbghAzkPkJsd+rU
         RPSduxGykZxZeh4QjcYUSIvW5i0rfnAcuReUeWO0ERb40vBzzl4qty/vI9uUk8SdEsr3
         RLZb53lu18UgiAXXZPlR9dRTSgnmJ2MneRPByXhtMbPI/M0yNf29UScfA7jo3pT0V8th
         t2K+DmfarUDHsu1XCvmXk4CQfTsy0B3b32y2eFrneZVU6LsfZ8UHjOAtT3r6h7TTA1o/
         z14caQJ5NgzvKdwIEWhbI8UUvLqywdSpgelSsoco0Oz1HyBZsA7d2LhFbNHhfl8cNWVx
         4HAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeXxJUYyFUMBD3REsCHpEj8aO8vNLpI121eEfs2y8kjPqVFzDD9KtyK9dLilHCRassR7A69TiXTYkzJReCFGY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyCOHERx7XmCO4/telydMx+iDEZpZe2xOk4pMZ983t9KsyCwOU8
	03vXgbE4H1m/DgC8Slxmf95oxDyf3zNfZ9qEBZZHYTStR47MHn9mbvsOIqAVtA==
X-Google-Smtp-Source: AGHT+IGw5paEXgQzTMpgS3LU/sXd+9iUm8nVO94EMaVZJzu1tumWk19RpK5qWPbKJV3j9LEKVSmglg==
X-Received: by 2002:a05:6a21:99a5:b0:1db:e8dc:4ae1 with SMTP id adf61e73a8af0-1dc90b37d1dmr14645634637.17.1731922443101;
        Mon, 18 Nov 2024 01:34:03 -0800 (PST)
Received: from lschyi-p920.tpe.corp.google.com ([2401:fa00:1:10:e40d:fa29:75db:2caa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9f1e24ce4sm8333500a91.0.2024.11.18.01.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 01:34:01 -0800 (PST)
From: "Sung-Chi, Li" <lschyi@chromium.org>
Subject: [PATCH 0/3] Introduce new driver cros-ec-charge-state
Date: Mon, 18 Nov 2024 17:33:45 +0800
Message-Id: <20241118-add_charger_state-v1-0-94997079f35a@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPkJO2cC/x2MUQqAIBAFrxL7nZBiUV0lQkRftT8Vq0QQ3T3pc
 xhmHkoQRqKxekhwceJjL6DrisLm9xWKY2EyjbFa6175GF0xskJcyj5D9aGJHQbfwrZUulOw8P0
 /p/l9P38eUSVjAAAA
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Guenter Roeck <groeck@chromium.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731922438; l=1941;
 i=lschyi@chromium.org; s=20241113; h=from:subject:message-id;
 bh=mgpxk1Id3EynGOXNWYWN8QXCMTV4djO5BklM9jOek1k=;
 b=S93M8Qm6z8yVyYooDGPIcBbKFzjnpP4+DusZuTLKwaJP/RewW6uWx2Hsl6ThQzR4hF9LqU7T/
 XFoRe728loECOBi/Arpv+Ily3CpPgxyV1JhMmBNI6jvqJoogu35WUwl
X-Developer-Key: i=lschyi@chromium.org; a=ed25519;
 pk=nE3PJlqSK35GdWfB4oVLOwi4njfaUZRhM66HGos9P6o=

There is a battery charger IC connect to the ChromeOS Embedded
Controller (EC) if that device is configured to work with batteries, and
EC exposed the application processor with a set of control to limit the
overall current used for charging and current flow into the system.

We have seen that the battery charger is one of major thermal budget
consumer on the device. As such, it would be great that we can limit the
current running through the battery charger IC, and reserve thermal
budget for application processor to have more room running in higher
frequencies.

There are some existing drivers that can limit the current flow into the
system, but they either require certain features (e.g., needing ACPI
supports for cros_charge-control.c, which is only available on x86
system), and these current limiting mechanisms are achieved via indirect
configurations (e.g., cros_usbpd-charger.c via setting certain USB PD
charging profiles). As such, I introduced a new driver that can directly
manipulate the battery charging current and the system input current.

Signed-off-by: Sung-Chi, Li
---
Sung-Chi, Li (3):
      platform/chrome: cros_ec_charge_state: add new driver to control charge
      dt-bindings: chrome: add new binding google,cros-ec-chrage-state
      mfd: cros_ec: Add charge state control cell

 .../bindings/chrome/google,cros-charge-state.yaml  |  62 ++++++
 .../devicetree/bindings/mfd/google,cros-ec.yaml    |   4 +
 drivers/mfd/cros_ec_dev.c                          |   9 +
 drivers/platform/chrome/Kconfig                    |  11 ++
 drivers/platform/chrome/Makefile                   |   1 +
 drivers/platform/chrome/cros_ec_charge_state.c     | 215 +++++++++++++++++++++
 6 files changed, 302 insertions(+)
---
base-commit: 744cf71b8bdfcdd77aaf58395e068b7457634b2c
change-id: 20241118-add_charger_state-8c0d6e9a5e45

Best regards,
-- 
Sung-Chi, Li <lschyi@chromium.org>

