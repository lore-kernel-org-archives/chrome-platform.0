Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48B22877FC
	for <chrome-platform@lists.linux.dev>; Mon, 16 Jun 2025 13:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080796; cv=none; b=oqgC1oSjQP1dFzkE3dts0YZCcJdtImNz7IXIn5+5XAV+6jPr8M930NIL5eVjz99A2Q3Drd0NOJHztKvqSqTA8W3tAWucLCR9nSB1D5BE1sdivbo7uMTGX4T/w/r0yP5ADpcApYK8fxjihKnyhPkKUXz8ol48v2MpkE83s93fg5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080796; c=relaxed/simple;
	bh=0xC0NBWhh+5FZ6EevG3lvJaPJC0xaC2CtQxodewDrnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NuZMSLqRMoWjPBbGsPzS1H5mv22VBICnoXO8IzeVWeCPFU1Y7urMc556iR+8GD/dz0iggffymGtXQ8QCj44bZ8yX5KU6rVhgkF+dbXp8BAKFKMY93rxDYIjZdOuCSFmjxWzYxJrPTv7ak1hGa+AxFyK5eiwaV+/vxjoF9yzJltg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LJW4asUo; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LJW4asUo"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-60789b450ceso8807609a12.2
        for <chrome-platform@lists.linux.dev>; Mon, 16 Jun 2025 06:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750080793; x=1750685593; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DCYACXhfENDI28fFqwzO6WcqXr+cZJHgaCmuMhA1C2o=;
        b=LJW4asUoS3Ahs8a0+A/MZp1gRn33rkMAAYIATG8H98r2kh9foK5/jw7IsHcRsPi7YQ
         uqkpZyosgiZIKPlqVND4CBDRX40j/EmOklfhyNMwVh7pjpxYSF3LhU8ocoABYoEmgNP+
         Yr6a4vf2XfhvUL6F5Epj7OdHGQNCnyAZWstPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080793; x=1750685593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DCYACXhfENDI28fFqwzO6WcqXr+cZJHgaCmuMhA1C2o=;
        b=mtxINVKr9/g/NfvQeMWlgfF37x6EM76Jqzoe1lJtfWa2EUyZnVSHDnuxmOkUSwfeTI
         +uERUsUcMPhuO0Q6XByXW9ZvXYejmlq6gwjOg/WQr9j/RKbkoD4bKNQQ33QiF4mIrvfV
         ky+1Rppzql5fMxIwle2mgqk+ngc9iYa9ERQgLKs8neClNBil4gi54mi/aLHAjL0aCNd1
         YX2tRsL2/ZhGAKRW2kepvZzwedcwKzBU5L10x6p45GRTq9zRbOmc4umGr1Sp1Q+EkIwS
         3RCvO0KGdprHNWRpe0mR+xDMArL3/T6ArzvGJsz0n5VZVGKDS9sm5XCbySlNdZtNuLhO
         LfJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxDijLYEJKxBSvG4HoWgiWfrcGOIexnM4BuO5AEAuyiYMpxo63KrjzZjV9gTIfSI2ebquLfN7glXIJitVqLqA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwliqwD4NS3uJhnLJqcXjENaFBocvw7KVlqPwdVmmhZ7H7l0/oG
	mbnv8gsRwaAbCb1HYWa+bcSMIH467wWN1Iq56EEOFElnrvOEtDp+W8HVu/innyTHQQ==
X-Gm-Gg: ASbGnctswrj14i8Qx4GiLFbyjSvoLU2Rx2WrqwX3Wmt5JL8rjAaEsrN89/OCkmW6T2R
	GUxiGXjTZdyeZbnapz2xaPRcI1K+lnFz5kyVReORKj7s0m9xAF9WzKRHT3xZb8oZuFspn0Ezlof
	Kt8QtymO24gyF+gOYWRRgp0A1Alv/YSD6Mep4UAWKhTM8yJAd7YU11wDNWuJDhloWZanuDTY4ul
	ox+dbT/mOT1GD8X+XyVxLIOxMrzkNx4R4D12qSLvX35ZD1OIoo7EpAFaaDoRAquGaNA7eFr65Di
	YowG3I10nS8y8at8MgwPbwxomcDHoofW7whkhbFkAOaWfGBEtJ3U7x06cBkhcHEmwLmVk+9ck7t
	h6QZoHgiLOCNI4KPPS02I+ebjzl/DO/wEs4OewgLxweKoQGykFIL+K3uRbg==
X-Google-Smtp-Source: AGHT+IHEB1jBPDHClH0iincBHttzHTsFdApFe/gtRaP+clRmz4tP9oguLOHtjZhuypGZtB3dDT6wTQ==
X-Received: by 2002:a05:6402:51d1:b0:608:50ab:7e38 with SMTP id 4fb4d7f45d1cf-608d08f7932mr8236948a12.14.1750080793177;
        Mon, 16 Jun 2025 06:33:13 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a94ce7sm6036664a12.58.2025.06.16.06.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:33:12 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Badhri Jagan Sridharan <badhri@google.com>,
	RD Babiera <rdbabiera@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH 03/10] usb: typec: ucsi: Set alt_mode_override flag
Date: Mon, 16 Jun 2025 13:31:40 +0000
Message-ID: <20250616133147.1835939-4-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
In-Reply-To: <20250616133147.1835939-1-akuchynski@chromium.org>
References: <20250616133147.1835939-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This flag indicates that the PPM allows the OPM to change the currently
negotiated alternate mode using the SET_NEW_CAM command.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 01ce858a1a2b..1372becaec82 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1616,6 +1616,8 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 
 	cap->driver_data = con;
 	cap->ops = &ucsi_ops;
+	cap->alt_mode_override =
+		!!(con->ucsi->cap.features & UCSI_CAP_ALT_MODE_OVERRIDE);
 
 	if (ucsi->ops->update_connector)
 		ucsi->ops->update_connector(con);
-- 
2.50.0.rc1.591.g9c95f17f64-goog

