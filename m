Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793178578;
	b=wgxZR/uPDcGc/va1/NESFpdElTXAYLyw1GdUTSO9OldXEExXmjT0ANnKSYwW/026iBxb
	 HUh7JL0fLo3/6x1Ku8gG4DBs1h7Qy7dgKAUBhg9umDzGmoC+kotbQO+W0MgXzdgpk0hp9
	 8Dq2iTJEjxcJTridRZrxTGEEZGtn/xZseH7/qK0N8qJUjFhde48NsqFZUBHnqGid6Wp8v
	 KlxyXRM9WHGc9/4qcNpgSE4v5usynUUY4QrY+qJn9Bz49QIXCn8eMHRh/EWGr65ZnME1l
	 nCUPaQIzJIa1kK5sdufEgZcCLgNOq6u0S22gg4Vr4b0lHQu5T47PuH/jvh1/fDHJmjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793178578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BewjTbyX3GEekMLgNvf6as21C5aN5VYwWHiBIc+A60E=;
	b=h3nCDedFWSO3MM+xJaXyunur5jo9oVNpKHWqTSp0mv/YkFrIIIl41Q0xIdZ8crAOSJhJ
	 JwuhdsZsavrnphGufglb3Jv4oTZ4q8eRALGZpeMSJxiUCVY2LBF+YJFI7UMWao2pRTZxV
	 eLdLtgBniS/qz1RAS1WpSvFALkbl/I8BTri56rEDwz6ZHgY72vDQSFQTuXOGSnnHsBAJf
	 p0ysvfpM+zdriaP5s2i8TgzP+T2KkAXK3Svqknvmkq6sB2gC6l5zOrmETe9QCVrOHRT9n
	 i7ux9S25NtYqIx5MQ1Qdcjh3nQcvcc2HvRU06VgqcwK1NYoezymHZ8DoBvVc/0Be9Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AEHVrixN;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B2B606A322
	for <chrome-platform@lists.linux.dev>; Wed, 28 Oct 2026 09:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90B2B606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AEHVrixN
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c2e8c710847so90572566b.0
        for <chrome-platform@lists.linux.dev>; Wed, 28 Oct 2026 02:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793178576; x=1793783376; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BewjTbyX3GEekMLgNvf6as21C5aN5VYwWHiBIc+A60E=;
        b=AEHVrixN/RzYaR60W68ylfkkkVjuCEJCJ1yy2r10OOacyW5A24jBb2U1MBFlYM1Yon
         h/UDpWQ+/2DWiBgS3me9+Lzlsz6xJMdW4a9SvsDVqf3uRqSa2tPcp9tDTmyMwfDo5UXk
         8CM/gO+IFfCEjD5WCptZhKQpyanQEKDAA9+4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793178576; x=1793783376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BewjTbyX3GEekMLgNvf6as21C5aN5VYwWHiBIc+A60E=;
        b=wNhgReyMJVoQORgFu+fqi+oEpzeALdLLrB8QMJlk4s7z6ICjnLGIuFPDxoCuuY+kEr
         bDsr2kgiM1wnv+HzdrdrqPm3gcOIU0KCZrBR1XxDCxAwMsPDQ+aIWXhleDeG0OhH4G57
         JBu3P8iXEBJk1t0YckQ2ujsZamagNol887ugQsPObModknY9eE7EJp69e6R8FVJ8OZ/0
         0kmFj+ZkiJQbDXQLH+Iy+/CFxVdsmS0xf2DYrrvUvq0ibrAZWXUtsdbVlZ5k+fUfVAya
         RV+eKlg8z2fzCKvas5AGCbOVRRwPhxdTqK5XjE88aqxei1d2yoQkVDODygpx3r3Petgj
         ZkIA==
X-Forwarded-Encrypted: i=1; AKwUvBwETO/YcealZCBMvF5AzAkMUiZcYpPO0/J2A2xo8s8E0DADh1yzovq8IxubxFXSoL4R3Z2/Oa63kygGh6KxcUQ=@lists.linux.dev
X-Gm-Message-State: AFq9FYKVm7vT3mFLFU7kZpNzoUhoPcDB0UVD5L+f5qtEjpS6sS20hLfp
	0JY3kNrC93OVDGdJUZfThmp17cUG0nZV9UcYbc3Q1WWCHYZu1UKaFFKTncAxAlPobQ==
X-Gm-Gg: AYBFou3Xj3Zq8ZHFxsbLkyAvkeeKEObDeSy4VAmignC48ipk4om9YO5RcWZHe4zLv1j
	b6cwIV0m3bcWxKTL/MIuiqeKPCRqno1wsb66mHNJTf97eOkyS72lojmqfX97V/ts7TmUypwcmZg
	ymWe+OS7PK08/9hZXfYg8bveGVyE5q9Khv9zylFcYAzyMFZhWvu6OpMvEnbCaTCf0S6z/kEvYjS
	uQLzwfJrX98ZPI17QnVzz2/CmauEfHrmEo0OpP4F3TTrqWKBKsPeSPAF2YOcwjrkNSbidK7mQ/v
	3SeXQFhicx+1mtyfIGgemsjONabid7lzPQKirt1nRpI3UBDf2pbY3g5rWCGwvf7JU3566uN47zY
	1mg7AF6O/j31lwz7OoX5diXygM8q0n3WhcmyKtKAwvVjarZmQalBWQEVgCJTIqnOy6Xa00VMJJV
	SH/9hzrobVh+naNqOJSasEwbkpvIzz91zvURXuSTGpGcMootWOMygT/1po0WbBOJPHG3zx+xW48
	ZCe8x6ZK2D3t6GiWOanFCIhqnUuOJLHbKQy7hxWSQi18BbmclgMiYvLWF8SWDGpmdaSvm4auNHA
	QbPJDEDRvAc/OpL9Xj9S2svsiUk4UrEyqqYversrfMlOeNgo5ics5yTGKTxijvfgdAS0Y9PX9mp
	CDgUvv0MtMsmI9R/sbw==
X-Received: by 2002:a17:907:9c05:b0:c2d:d408:5d9c with SMTP id a640c23a62f3a-c49be1b40ccmr129905566b.48.1793178575888;
        Wed, 28 Oct 2026 02:09:35 -0700 (PDT)
Received: from localhost (103.45.147.34.bc.googleusercontent.com. [34.147.45.103])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-c49a50c434asm257577666b.5.2026.10.28.02.09.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 02:09:35 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v3 0/2] USB Type-C mode selection
Date: Wed, 28 Oct 2026 09:09:30 +0000
Message-ID: <20261028090932.27053-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series introduces priority-based alternate mode selection
support for cros_ec_typec. 
The base patch series and UCSI support was submitted here:
https://lore.kernel.org/all/20260119131824.2529334-1-akuchynski@chromium.org/

When AP-driven alternate mode selection is active, the driver enforces the
mode_selection bit for each registered Alternate Mode. This blocks
individual altmode drivers from self-activating. Once registration
completes, the driver evaluates USB4 capability. If USB4 is unsupported,
it falls back to priority-based negotiation via typec_mode_selection_start.

Additionally, we swap the registration sequence of the port's alternate
modes. Registering DisplayPort after Thunderbolt correctly ensures DP is
prioritized.

Changes in v3:
- Replaced delay/timeout consts with macros.
- Downgraded USB4/mode selection error logs to dev_warn().
- Fixed comment formatting and added comment for DP/TBT order.
Changes in v2:
- Added this cover letter.
- Rebased on top of the latest platform-chrome tree.
- Tested on Redrix with Linux Fedora 7.3.0-rc5+.
v1 Link:
https://lore.kernel.org/all/20260129131928.794768-1-akuchynski@chromium.org/

Andrei Kuchynski (2):
  platform/chrome: cros_ec_typec: Enforce priority-based mode selection
  platform/chrome: cros_ec_typec: Reorder altmode registration

 drivers/platform/chrome/cros_ec_typec.c      | 65 ++++++++++++++++----
 drivers/platform/chrome/cros_typec_altmode.c |  8 ++-
 2 files changed, 60 insertions(+), 13 deletions(-)

-- 
2.56.0.385.gac671c819a-goog

