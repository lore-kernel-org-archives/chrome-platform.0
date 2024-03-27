Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572BA2E630
	for <chrome-platform@lists.linux.dev>; Wed, 27 Mar 2024 07:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711525494; cv=none; b=IrFX+ydF6G2/spybD+HW1veqL7a4bbbBe+nRyot9IFU+wv/P/OA0dsvIov1cvaLKM0Cgg9TlJxoVusED3TU9RIeu+EEOAf8tj2QILxSLuMccPlRSPXw/GP3sFiji+WZaudj/+Zs5V0OrfNMXHRmuz21UTRMqgQhkLx1WdL6yiuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711525494; c=relaxed/simple;
	bh=6br28ve/FXqsWx1ZCvxz0Tu83LXxj9nH9sMbL0OwpKA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vm/Pn5KNuVw0Yzg7M1DAJOkojMADbG0THm3Zq48sFK9VAnuG7b0zYO9CWQU4Xffcg6YNajj0Y+MN++AlWye4j6o3c/aOaHChfG/fkKBUiyPZv1VzmWHqY85MMVARXJw2Ov56BPHZWz7hyaQiBp66iNXioFyMzkwSess7BoqReJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WB+WgQJ3; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WB+WgQJ3"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-56c3689ad2cso1251748a12.1
        for <chrome-platform@lists.linux.dev>; Wed, 27 Mar 2024 00:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711525491; x=1712130291; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h9V0L1ZLhaNkMq1FhYv9Atk2X7ZenOQI6rYFcqjZS6M=;
        b=WB+WgQJ37vrrClPCF8NcBkHCkoDxfJoN1aUkWnLoccvTAMQnlkbVOCmoIHp9W8yFK+
         TEZWxgkviXhfv1oazEMSUMncVdw398jpBBovB3wKPc284apMpY2TDaUHMUsbrZHte6o5
         0VG8iRBRqtxh37oWhDjp/vFRIReZ/ioGKNNifNuQc5HchEioxcF//pBhIBqnBrneEWZP
         o2lGrCPthJX6F6Dn0ot9HoORYMtsB1m0Jt1fRVIIkc45KoogSGgOgxmU8ntqZl/cDJtH
         dlBwDbNX6LURWy9a+0FXnulbr7A02xDZq9hCPyi5SDN15/H6+p3UJAlPzxi7y466NEIF
         VixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711525491; x=1712130291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h9V0L1ZLhaNkMq1FhYv9Atk2X7ZenOQI6rYFcqjZS6M=;
        b=Pbo4rbr0+XxtmM+lYMZ1TcOSvcm83jmbco8HMZ8k/WnFfxXAnts/vtYPUYQVUzwCqj
         X1ENxlOTgKCbXMh7/lPSVr8dmcbHNxoUAcoPHf2OV0lQ9g9rgaeeOA250AquDlexvDjn
         6H4B8GIOoncVLu44rC8IZRcXdTuvh01GYO40fXrvRxrnk8XIEywAqji8Yg0soWolbqyX
         nc384xiesU3NBuFnvFg6XWOpJyNjIEZQl9utfb/ymyOc2rhRi09rrhVWxzZx1vTE+/YT
         GyseIFT/2fWDjFvAfvxOAWA3237Q7r8Lyj8xHmXt7MilIVES53QBcGfQ9eBcQc42uLUt
         VsEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVacXcDVbBegBzfrNmpVDjhTR0Xh87OC/aXZUKe0dW4QOhvdRNZ+ActtVI3dS+Sgyxe0F5n7Wvh1m9o+o8dy/OnXYSdHBDyT7WpTExTocB+
X-Gm-Message-State: AOJu0Yw8QJI5uoLo0OWBmuxszghlJZjueH5lFlZAxFwdwiMqUIpY4/rK
	WpCJfQTw+cb/KLjnquMV1WjCUCbTw+JdWaf1ne5MZ2sklFhIQp+sr/v9an1c0ms=
X-Google-Smtp-Source: AGHT+IGFKbQOUtMB5KvpSaLmV6b8D0XGCUe2Bj/zrPy14ymo+p+EVPOM+Ze3N2aCDFRRCRoTYoi5BA==
X-Received: by 2002:a17:906:3859:b0:a47:4fe1:cf99 with SMTP id w25-20020a170906385900b00a474fe1cf99mr3541736ejc.21.1711525490747;
        Wed, 27 Mar 2024 00:44:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id am11-20020a170906568b00b00a474690a946sm4671745ejc.48.2024.03.27.00.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 00:44:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 08:43:49 +0100
Subject: [PATCH 02/19] Input: atlas: - drop owner assignment
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-b4-module-owner-acpi-v1-2-725241a2d224@linaro.org>
References: <20240327-b4-module-owner-acpi-v1-0-725241a2d224@linaro.org>
In-Reply-To: <20240327-b4-module-owner-acpi-v1-0-725241a2d224@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>, 
 Daniel Oliveira Nascimento <don@syst.com.br>, 
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
 Matan Ziv-Av <matan@svgalib.org>, Mattia Dongili <malattia@linux.it>, 
 Azael Avalos <coproscefalo@gmail.com>, 
 Richard Cochran <richardcochran@gmail.com>, Jeff Sipek <jsipek@vmware.com>, 
 Ajay Kaher <akaher@vmware.com>, Alexey Makhalov <amakhalov@vmware.com>, 
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, 
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 acpica-devel@lists.linux.dev, linux-input@vger.kernel.org, 
 netdev@vger.kernel.org, chrome-platform@lists.linux.dev, 
 platform-driver-x86@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=743;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=6br28ve/FXqsWx1ZCvxz0Tu83LXxj9nH9sMbL0OwpKA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmA85MbO9/c8V7YBW1fVBeuTl0P+qXpTG2lnMRR
 bIGYG/Xm36JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgPOTAAKCRDBN2bmhouD
 19rjD/9C/YrJEyaKFgPxEbaV0HglMD9ietYj10qKT4zl0cuRemTgRiX+JeEiFs89LSUVXmeZYa8
 q9LTQauGW9TAfk83KaxRRxgGuoOQj8azBW+UPLWSNcUpr75WpH4pnyZeT9BD5H1DqAVPXU8jn5f
 wiCGyXHMpD8KA8UcoV5eLhA17n4xZkkJ6W9RBvu2AYSjJy28hYENIBT0AdmSQgWnbSgMWXTG6H9
 eDZxX0P6hX3/il3u/d+Zc5+B4/S9H0tmMvu4riiLz6IATzn9lr/CwtZmtLpfxadMF9anXuytUcG
 1h8wFQlWjNYIXjLqNTJ+6JQoKlqLINzIEXIPvoGSed9spBmO5X1jbuTvaiEKTBfXWHPTFHw7L5c
 ywaP1ukunboXRf8ltoverlAl6XUAioo9JtCzrEaAkiQCV8qAhJIsMfYhlK6VkgaB7SCYDY18fxg
 6MOnBn9jIH7gInLSsUhQ3L1jkOYdRwRq2jya6MHpx7tNZqZ0E4Ip6893YM3l7oZc36m6a6usJqB
 OtIzS96gFL5ksn69uU26PePp/jMQrpaLhNi5qTnSk0N3NP87ZjCYoYFKXMg5JXL6QojfkzMGhbw
 iCZhnS/A8lMeWnLrCLtpc8p5pGyjCdqCRfQ8rtu65+pQCSkM71fR+zhpKFeeRA6VtwVPjSdlR+O
 GsT2fQHAtcC4y1Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

ACPI bus core already sets the .owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first patch.
---
 drivers/input/misc/atlas_btns.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/misc/atlas_btns.c b/drivers/input/misc/atlas_btns.c
index 3c9bbd04e143..5b9be2957746 100644
--- a/drivers/input/misc/atlas_btns.c
+++ b/drivers/input/misc/atlas_btns.c
@@ -127,7 +127,6 @@ MODULE_DEVICE_TABLE(acpi, atlas_device_ids);
 static struct acpi_driver atlas_acpi_driver = {
 	.name	= ACPI_ATLAS_NAME,
 	.class	= ACPI_ATLAS_CLASS,
-	.owner	= THIS_MODULE,
 	.ids	= atlas_device_ids,
 	.ops	= {
 		.add	= atlas_acpi_button_add,

-- 
2.34.1

