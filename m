Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DF729DB86
	for <chrome-platform@lists.linux.dev>; Fri, 12 Sep 2025 06:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757659685; cv=none; b=TzWHYNG7VHLXde70FeUaSi7lcJoFI2rJhX+G2ekMCt6mB4h5jbhVSuGif+ogw3n3eRCrOLtZ1ZDJmur68hPszvn3Gf7rys9pdnGJQXRLYRj1N1gK7K3vuuGCtKQql6BmtnbDvKh5w87o4o90uexeIzLDgNXQgrhyhDLX9Bw1zog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757659685; c=relaxed/simple;
	bh=6KQEugjnx2rJCM48+qtPictQnwqObzm5rcbLajzHMU4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HGk1KeNN+Fe51X0g/PnkBqFZJ0T+AWiNO0x7miBF4zchhPnsUQUMifNqKgjCpTv7EXpIr8sW6t4ydhlRv76I0CMCV51xloC6Mx+RuH8Z0LmfEzOLppcqV3owlqzdVpk8h/mzlHtB/iZcF/ujycdWEQKkFkpJvaNctWwwAD0oRvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=S2Fulc6a; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="S2Fulc6a"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b045d56e181so224780866b.2
        for <chrome-platform@lists.linux.dev>; Thu, 11 Sep 2025 23:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757659682; x=1758264482; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/NeNrKd6NoBbgDfjKGLBumkxmas+f61lF0BwvgkVNtg=;
        b=S2Fulc6aG3gegBnbXbpOBmkb1PTpNmUT9zhZFq9sjs5bY1zxwAzf/a87gvWXG4lxuU
         1wXXLVtGMo1GUcpJQRNxNfBdvigc5n6Hkw4PmOzpSmhbyLIleIEpyY/nnjnFAYKiRJvV
         G3O4hvAz3akEfeOqqrf1uVoM7ASE4V+vqsDDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757659682; x=1758264482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/NeNrKd6NoBbgDfjKGLBumkxmas+f61lF0BwvgkVNtg=;
        b=cxkm1XYSxGKOLC1K6Se6xdbqIQfoK5GpMAspzgEzWiJoYYfO8bYSZDdcYhElSd4EJc
         PITanACk7ebeQzttU7FOwNcDLiMUAhc+fAD2wt+UCRt/uzeeydMHIy7Pc8Fgtw4L/Vzt
         waWNpio82mLd3KVf9DrTIDDafNBPVjQLX0tO5ggWVp2MGffS71hlvRnLdbdmzUvpAjoi
         Ki197OEEpFwhASQfkjREgtuONF7IeUtX1GZQz5g+TZJQMgfQaOno2Y7jeoXQFFh0PN/Q
         7Zb3PA7InK2DXBAT3Wd/e19lO8MK3/8sxoltbp/n+w2sM0/IDO3pX/gqHk84BCEaQwED
         LHhA==
X-Forwarded-Encrypted: i=1; AJvYcCU55Zwniinp9XBfPDW3s1R8j0MjRWu7R6JT6E842c6l7w0vUOieiNxsb16LsS+1uRnMGI4YdRbhx+rjU02P1yw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwcjFpj4AyyeAx/HGrhKTyUzxRVycVbI919PWXhq4AmNWBCIHNc
	5uoZOVtyWEDC8MWwJgvbfUj3UQhiUtwnQj87DGn2z69Cb5oqIrUqQY3BH+Q14Fq0Lg==
X-Gm-Gg: ASbGncuZ9tfbOBr1gb42Ze3aQL5YJVj656Wc72uhbyzCdVloUdQbQJhH/7qQ13aQaHM
	haZ9+GKOLtm4ZSfrKWQ/xZxqxxORHV/9g8/yTAwmVKIIzXdf126dDW8lnT06RECezJxI+VsREzv
	RZX9GotuFfBqZIXgEm+dSxgICh23AvHAW+Q8iEh5n8MHVePL3HblwVDy/9cYc8mrNWfqub18OdK
	oC4KCT79hTkxs3y/Rsc9cjlDNzP2o2lOIg8qlZwnDFBMXizQQKE5zSLHw6Zj2iY254tMnE5mw50
	w0iV64v9Ng2Vejv4qLPtnuW5kq6dKBjfW9S8lwXCk67keYzuiEFLQiIBljl56xxsc5hv44eoTer
	le2fR7Q69na7KwN02VwOTCcrwnq8t2wOLB8OMLXfTuw4YnB9PbzXHr/1Gp/LNRf0ZHp99vDFpRg
	xPw2jN4RGLN1nXLsY=
X-Google-Smtp-Source: AGHT+IG1I03T5HSq2OfkiQuee3J0Y3gSkDAX+xUtryPFhxhfXEKh52whMlG6mWqFElm4wgmiKoe2Pw==
X-Received: by 2002:a17:906:794d:b0:b04:8701:7304 with SMTP id a640c23a62f3a-b07c3546e64mr171386666b.10.1757659681595;
        Thu, 11 Sep 2025 23:48:01 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (240.225.32.34.bc.googleusercontent.com. [34.32.225.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b3128a1esm295465366b.29.2025.09.11.23.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 23:48:01 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v4 2/4] platform/chrome: cros_ec_typec: Set no_mode_control flag
Date: Fri, 12 Sep 2025 06:47:49 +0000
Message-ID: <20250912064751.1987850-3-akuchynski@chromium.org>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
In-Reply-To: <20250912064751.1987850-1-akuchynski@chromium.org>
References: <20250912064751.1987850-1-akuchynski@chromium.org>
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
---
 drivers/platform/chrome/cros_ec_typec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index b712bcff6fb2..c0806c562bb9 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -491,6 +491,7 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 
 		cap->driver_data = cros_port;
 		cap->ops = &cros_typec_usb_mode_ops;
+		cap->no_mode_control = !typec->ap_driven_altmode;
 
 		cros_port->port = typec_register_port(dev, cap);
 		if (IS_ERR(cros_port->port)) {
-- 
2.51.0.384.g4c02a37b29-goog

