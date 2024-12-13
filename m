Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEB61C0DF0
	for <chrome-platform@lists.linux.dev>; Fri, 13 Dec 2024 23:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734132965; cv=none; b=nbjP7168FAHIvaCd2cLk/1Wgz9jO13CutsMl4t/QTov78iFtloAlGr/VRV2AfhoBCS2JGU2+o01SyJNq3h8QHoxcF2SR9L8AqbtLnwejP/v+cln+tgM0srC86pikkSXHVLHoLurXXQDT1ebxMSnY+vTlp2U2kMWdFgsGW28J2O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734132965; c=relaxed/simple;
	bh=bC3ASIgFU8+jf99/fkIhb8slZurZDJG8FhuOc/gydBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lAfc4OyRzQCL/UYL5kMRn4FXdAgXONbiQ/TiWVQ88AITriZSwJjU4PRvaKnQdVDLdxRtZBgLUIeq8/tAn0X1tQzSc/iGalHj8/JpqfLdc0c6v8uE/8p2Vg+MtiJbwI8nUg06aW2rWFKMor16v3DY1XN1JInXDRwq6Eo48B5oAY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dF2rbCzi; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dF2rbCzi"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-216281bc30fso25730495ad.0
        for <chrome-platform@lists.linux.dev>; Fri, 13 Dec 2024 15:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734132962; x=1734737762; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=py5tiwOmlBmtYEMtNIBu6hO+Zuc2fcdnOeR4Wv1Ac/o=;
        b=dF2rbCziCWV0Jq3oR3UKjUwwl2HqF/24mN9WkkIWrux0ZJptmIgfdutBLjf5osIexi
         coKMJmTtMhRuESa72HagiIbHXn2e+8ndgLOBtD5j9v+Q8ZjSTXeCAmiLERABSSyv4yTC
         4vzQLF/7E1nO70LuhpQ2URhzg1ycp9ZRHrFuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734132962; x=1734737762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=py5tiwOmlBmtYEMtNIBu6hO+Zuc2fcdnOeR4Wv1Ac/o=;
        b=TCFoRUHuTt9Ohbpku9UeFf37sw+R1K+fEsWA5x/zEUAPciEpVk7YettFlBTgdCsKDW
         C5P6jUuEq/rJ6I75NkAAga3ReKWWECNYri97YPYxsnqqewhI6AYXimn3UvLWIX8rKV6J
         Xkf5PpgvQmzArQUPVLSbGhf8EUU57210pFzptHN8Jaaf1M/afTllXXHOmleU4cvDedeP
         eXlc1qEnVGHY3maHCW9LHEdgvSQkgPzwhsZHuwf9eJswN68xiVUT9vGDDNhdXWZ6ZtWT
         LowpwIbLxIkfgiN03+Esbi4G8OKxUIsfc77/i2snDUtmHkKCPFsZ4dVcxZsroMkzVam9
         wQJw==
X-Forwarded-Encrypted: i=1; AJvYcCWMJY9PcQ8s0mLjegb2i6oL37SHPGhid7/Ywv2ZXtC9FbnUM4/vKm1+XIWLT1zbnacnPduVAEbqwFuhOjYbmmM=@lists.linux.dev
X-Gm-Message-State: AOJu0YySVsajZzUtfqmCxPPjQEzGF+mGPkZCVwGwT8oLpYyb7hiAVh6f
	GzNBSupOI5JuXg3Xsb1Kup5+I+ElTdNgxDnfDAxgFcH41R8kNkD7eykioQVBLg==
X-Gm-Gg: ASbGncsf8Ki/9+olNzoNH4qZ1HhLGDacs1N/UhusgbJ/+SBhxfgOsR7P7IsXvcZLyTm
	gesPuvyRVAnOf+rr+uetqbqfWfeNMIJ+lcNIF88qk8LmvvvwKeL8mMKf49DERgk6dZQWCeypoih
	sGy8PFQ0B8//d3ky0urGhT9pyTw1tPk19vz11jbiGl54481uwrD3i0EgvaCDoDLhe5qsh5LjXgH
	eukZz8PWo0H0EARcsJ7gjPUoQOlQtH0a4MX9gNVQlRQEp0LQ5zeI7Rwpspsip5i0sAk5OA7AKj6
	kBosUdksFDKF6Put9r0QT2LTTlTIg8U=
X-Google-Smtp-Source: AGHT+IEUZ/6o1cO9iUcIyo1p1TtmFetHKWo3k/+ZY2PI6TucwmSTRM8JHLezHdDWh5JZ20Y9zHM9uw==
X-Received: by 2002:a17:902:e890:b0:215:94eb:adb6 with SMTP id d9443c01a7336-21892ab81demr76675885ad.40.1734132962220;
        Fri, 13 Dec 2024 15:36:02 -0800 (PST)
Received: from localhost (227.180.227.35.bc.googleusercontent.com. [35.227.180.227])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-218a1e5499dsm2824495ad.126.2024.12.13.15.36.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 15:36:01 -0800 (PST)
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To: heikki.krogerus@linux.intel.com,
	tzungbi@kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: akuchynski@google.com,
	sboyd@kernel.org,
	pmalani@chromium.org,
	badhri@google.com,
	rdbabiera@google.com,
	dmitry.baryshkov@linaro.org,
	jthies@google.com,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 8/8] platform/chrome: cros_ec_typec: Disable tbt on port
Date: Fri, 13 Dec 2024 15:35:49 -0800
Message-ID: <20241213153543.v5.8.Ic14738918e3d026fa2d85e95fb68f8e07a0828d0@changeid>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20241213233552.451927-1-abhishekpandit@chromium.org>
References: <20241213233552.451927-1-abhishekpandit@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Altmodes with cros_ec are either automatically entered by the EC or
entered by the AP if TBT or USB4 are supported on the system. Due to the
security risk of PCIe tunneling, TBT modes should not be auto entered by
the kernel at this time and will require user intervention.

With this change, a userspace program will need to explicitly activate
the thunderbolt mode on the port and partner in order to enter the mode
and the thunderbolt driver will not automatically enter when a partner
is connected.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---

(no changes since v3)

Changes in v3:
- Set port.inactive = true instead of auto-enter.

Changes in v2:
- Only disable auto-enter for Thunderbolt
- Update commit message to clearly indicate the need for userspace
  intervention to enter TBT mode

 drivers/platform/chrome/cros_ec_typec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 1ac5798d887f..6ee182101bc9 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -311,6 +311,7 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
 		memset(&desc, 0, sizeof(desc));
 		desc.svid = USB_TYPEC_TBT_SID;
 		desc.mode = TBT_MODE;
+		desc.inactive = true;
 		amode = cros_typec_register_thunderbolt(port, &desc);
 		if (IS_ERR(amode))
 			return PTR_ERR(amode);
-- 
2.47.1.613.gc27f4b7a9f-goog

