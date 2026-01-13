Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8E538F94B
	for <chrome-platform@lists.linux.dev>; Tue, 13 Jan 2026 13:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768309549; cv=none; b=Vhg32CsEHC5E0s0v4RZJ9URN/SLGneNg2cfkjwY8VAbiCPn84X/S/rcZmhFAat6SLqqo1VLiQQ7nVmycWirxILsTjiPb1ZaZXvBaBBu3OcpC1OmGthxnDM2G9WCI+miR1S6N7Jif2QPffRRzHp9D5lfuyzudCavplt0J5z6utLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768309549; c=relaxed/simple;
	bh=aP2YFO92lDva0e1jN3T5U5hBf2PD7EyvHXkgrzxR9eA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J0egyn+0fJ5io3LIO+x/AmaOMc7XMznviUbWJESoEaIE2q4sjKtU4zYYOrcZ7y1Pt9rw1RO0TAWF0orjW6LnEUx4nzE9NnRBhAdE4p2520bnMbG+Nt9u62MEGoTOObE7MpeHg9xX8bWaJpT+RVK3XkSShSVZNw1x9WviqmE5xmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jydM9AT2; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jydM9AT2"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b870732cce2so353631066b.3
        for <chrome-platform@lists.linux.dev>; Tue, 13 Jan 2026 05:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768309547; x=1768914347; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHMLWRy5Z3mpMYGMUoVXUolvpCNuwJWbgQEgoyJgmAk=;
        b=jydM9AT2H/Pgp5bffWYqsK2IUz3YYbs/398WHSSfJIE/m3d0No59BUQEOF6KgQA+tm
         EuuOLI9gsibrPh8As7JrH8Y33VcSErsBNXvW3k7WE9sYKAImj3rZVOHok4x5RiZGNTbT
         caNNnWqZmxUhmzxJvF2j9GkH23wOFCTPNXPkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768309547; x=1768914347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KHMLWRy5Z3mpMYGMUoVXUolvpCNuwJWbgQEgoyJgmAk=;
        b=S52U1Kxm65COJZfeOwygBzdlAWXFaPl0RE0gHz1nI/rizUCdyyHgVTOkIsOcYK76iW
         ssKyWXyCfPdTabHjCR5JXyOXydolLKIsiJeamAmh3KzMyHL/8+Gawz5HpvCVaGTdc1pd
         zCjTPHwOaM/V/l9I4IjWp8NuP7mjwBNY2/zMGsfdlSwahgli2vXeNLnQQoM4GbXVzKR0
         jM4sY9mrFq6oie+W/Z93oEASIUvoP2dINrTbzECF7FCkkU+TDpOvtGF4F2H3tqDjpX20
         zCLZSeuvL037DiqPvGWr/tFzTcWAp2KsxoKDwRk60fITjJJR5TexCgFN2mTTnI25DRL6
         YeOw==
X-Forwarded-Encrypted: i=1; AJvYcCUFxYfzA2Liwmvi0yCzB8Sdb4kPN1AvrNgw1nNz0ZpIxh6WPrOyyryFJSRlLRocW2W27wa/GPMi1jeNE384W94=@lists.linux.dev
X-Gm-Message-State: AOJu0YzM/dc/KMljCfGDauHN5mt5xFsW/7GUb+4/sdulxL7rO6gTXrCM
	tM5dy4G8m6X6420gejbz0PLD4IUNw2Xeiec7h+NStk72eoLvKU5SSnucNQqvSs1QqYkro9qQZkK
	Hw7hmzg==
X-Gm-Gg: AY/fxX4TQbwTsnmZcAm0np1Fc2H4GKyB8hhCyxG9v2aD8UryLrQFoE1yxaThzRz0S2g
	KjycNdbGCs3xt1iSaFDad5+RpAMccGIAYPWni7PfHGUGY/p4NEwKClebavAwe22NAfmgJIhBcyi
	FgjqDudM5lpMjJoa/FYdWHNc72hn+fgcBgGkpMaHgKWVFu+WPZy9Pk3L5MftNG+wgtAc3X5Ljcz
	2AZx13BcmA4FduDcevyDjEuyeBtXOImHMcra3XH+UvXloEieLXjAuznkEt0kbz2ZitN/NzxwyXl
	I1MVrHQwGm/79MoC48APpqNocEAmGfu8wjS0e3nx/XEqkdvmy+CWb08GDQrX9uisiQrSQVnIAb5
	YE7XBPj2AkO1Wq4R6zq3ewu4Md+0PT1msoXAvKtID7Ppnn2wp1xq9chTwo2CgGJyKvGEwuorHV4
	4R8afLvE71PSmUmqnl1NfxlEs3tyJy/z/Lwsl5fFRZESCLvInRy6RcHXO1QFDi2pDoLGLp3wHQX
	mvleb4K
X-Google-Smtp-Source: AGHT+IGYDiJcte/TlGQ/Kqo75hJm6ijsCffQe6+xWAOzGZVEzXJ6AGMRNDBXwFdbt04+YpVYAKbzhg==
X-Received: by 2002:a17:907:3c94:b0:b77:1233:6f32 with SMTP id a640c23a62f3a-b844539fbf5mr2233587966b.48.1768309546845;
        Tue, 13 Jan 2026 05:05:46 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b871b5e60dasm586217266b.63.2026.01.13.05.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 05:05:46 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v4 2/8] platform/chrome: cros_ec_typec: Set no_mode_control flag
Date: Tue, 13 Jan 2026 13:05:30 +0000
Message-ID: <20260113130536.3068311-3-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
In-Reply-To: <20260113130536.3068311-1-akuchynski@chromium.org>
References: <20260113130536.3068311-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This flag specifies that the Embedded Controller (EC) must receive explicit
approval from the Application Processor (AP) before initiating Type-C
alternate modes or USB4 mode.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
Reviewed-by: Benson Leung <bleung@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index b712bcff6fb26..c0806c562bb93 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -491,6 +491,7 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 
 		cap->driver_data = cros_port;
 		cap->ops = &cros_typec_usb_mode_ops;
+		cap->no_mode_control = !typec->ap_driven_altmode;
 
 		cros_port->port = typec_register_port(dev, cap);
 		if (IS_ERR(cros_port->port)) {
-- 
2.52.0.457.g6b5491de43-goog

