Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44CE1852
	for <chrome-platform@lists.linux.dev>; Sat, 30 Mar 2024 19:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711828197; cv=none; b=d0yp/vPhKYoiH2VkYehtZV/SD8EXBt82skYYIWs01xgvxFBCQ299d6bC3MdbPIP0ECOX6V55hma46QVTwm2X1+43Xz3Vk2jaSbV5fLgXo9SuGBem8BPa7u/q6hQm+HVoAY3plT1172KFy22qhiOv42mOkEXbIgAZvBFDfd9e6K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711828197; c=relaxed/simple;
	bh=8Hn+EaanEab2JDM3jBg92mm8pL5wCUVEzB3roEcU3XM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LgUepk4MgcmsIE9Nk09WIyJ+hsbFupZRACLmK5ZtkO1Z0xeO8SpeQKQZyGDtMibC8npi3Mq8C0rWnVyZHY2cMZpVu1hXOco7Vo/u4D/sJ1zJ6h0XeMvnbvj/taZyg2pqG1c3uEl56d2bXheHPP0T5ZXqU2XkaCZiDDwB7Ywc718=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LlsT8ef3; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LlsT8ef3"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4155c1727ceso2525595e9.1
        for <chrome-platform@lists.linux.dev>; Sat, 30 Mar 2024 12:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711828194; x=1712432994; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S3qvF39pRy4R7BnWph070mUCSaM92GVdkELZj9hnNrI=;
        b=LlsT8ef3/5KKkJZ1mskTjv5QZInvUpJoJwbySox27zCVixrXTLJfUKexzJ5KCqv3X5
         DohNHPptmEhWAs5rf5dfdg3hcHs0F0qVrnOCxFdhbzxqamFJRTvTSDyP8cxkiByw8pnU
         04di20r9B4OoSpa9QMPlpGo31Mf4E2VB5hh7vDzHNpbvJ7QkPM+HSVJaXv/qYe01eN3p
         zkFGEqTtJtnFYmnGsXsPaK3NGJPiaH6l5qgQAXZ5uptlDTo/xKjVITMT2qSDngHBeqmr
         yb/yuv7Po3/HL46SYIF4ZTdHr9r2TTD0mof9uiFywDIx9Evc0Ic3suCjh+8lq0FW2MAE
         rtqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711828194; x=1712432994;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S3qvF39pRy4R7BnWph070mUCSaM92GVdkELZj9hnNrI=;
        b=Dm7kFtyJmz7+5udzwl2XSMN3wChodCcffDZGuYjIJi/7gdQF9yQ9lIzE3LaYFq5As/
         AgADVm8x/2WZdRuiDVK+mtQDXJxlF06vouPxkIKL6PBxcDe3gX0/kxwQ54CLFJJHFkRp
         Fu0E+HbkcD6JRrIEkTV8Ln+/6aV3mOWo+izWHSfsvZR+uOpiL0AwDuXfLy2bX1JOCobK
         f+FXuL6fFEJvDM+83SgmB+/zmUvd2+NOANFSuzUc2jpCa9Zql5uY+EvyBATQ1K2y5gZL
         OIwqXXqBAQrUsltkaPPPNhrwsrTZJUfcVjXCN9sR/tkS4c48MCdD14Fx8EH5IGX/ckmX
         DtDA==
X-Gm-Message-State: AOJu0YztCgwM5Ho2vMSfijpTRFtWIg9vBiPGWgLady+DGzS4n8432HL4
	qm6fhlTHcIHBQ2utlcRc0BYbb+JoyqKWsMDJLDCMsphFRZvDmXrhwyAqQulsmHk=
X-Google-Smtp-Source: AGHT+IE3gSn+oNncAsm/dayJ48d8laE2Qkgr41iVHwDyp6+ittqexJxaB96H/iB25pmLYxCeQPf1lw==
X-Received: by 2002:a05:600c:458b:b0:413:1741:28b5 with SMTP id r11-20020a05600c458b00b00413174128b5mr4216995wmo.9.1711828194038;
        Sat, 30 Mar 2024 12:49:54 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id t14-20020a05600c450e00b004148b9272a7sm9571616wmo.0.2024.03.30.12.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Mar 2024 12:49:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/2] firmware: coreboot: store owner from modules with
 coreboot_driver_register()
Date: Sat, 30 Mar 2024 20:49:46 +0100
Message-Id: <20240330-module-owner-coreboot-v1-0-ddba098b6dcf@linaro.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANpsCGYC/x3MTQqEMAxA4atI1gaaKsJ4FXExtdEJaCPp/IF4d
 4vLb/HeAZlNOENfHWD8lSyaCqiuYHo908IosRi8861rGoebxs/KqL/EhpMaB9U3ErX+4UMXiQK
 Udjee5X9/h/E8L7hn9/1nAAAA
To: Tzung-Bi Shih <tzungbi@kernel.org>, 
 Brian Norris <briannorris@chromium.org>, 
 Julius Werner <jwerner@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=758;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=8Hn+EaanEab2JDM3jBg92mm8pL5wCUVEzB3roEcU3XM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCGzeRXDsRJEM2OslU9yvkcI2tGi9th0cFwYar
 aJd0L12reGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZghs3gAKCRDBN2bmhouD
 13hoD/wMYbrajMMjmQW4hS7pjoIuKEnwY5kmJgRN1cIcYK92El25pUsbdGjwQWhQ73PG4PJwoHt
 KwgIM59LuLWd+tYs64ui99Iyco7+Kyn09Dx236lILomAV36rMdU7GXDtH1PqeLmcYzz4F17rnhU
 az7lu3p5YtKI2j+jUg11dHa7gRezQbwR0007/CGRZuZRbmWL3NCAGVbo5tsnp2BGNL1RzbnrLb3
 5aPwpn56p62G9OK1DmkzVg5KP16je04s2Wg58P3DZE5KU87wjBjlANYH01+3GlBWaTnf4aOvoHB
 T+hJgxNgIVp8hQM5aZnjxJ4D9yPp/vCgTmnriRlngKdw6bsoly/KQkq7fDFTpk3SVMNxzIUK80y
 YxKDxm9Xs/Z1VYOme0GAANoxktPFgD3EUKJi0ay+2WDEfIeZlFeDXjmZD31sxGQTooPRIddrjH4
 76UbkeoBHld2cfAULg7laTuRTLLUTu6bZHu/9kFEVHqegYiJzhLaKBbHEv99XQGfxhCd3xROGQ3
 9GUZU92fRT2fk8lza2cvKw6d0+lF3MvxRFtZspQ/HITQShmhd2oGNFxAfZAk2XG/ETCskEK0fQL
 QlPG6cSQ5Y+GY6eT7FQnY5FwjhlUqLYiVIa1J7zmKYX6Ltjq5ZlWdXXQ7W2yxALGataoKDmd796
 6xJGrZLYlxL7lEQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Moving the .owner setting code to the core this effectively fixes
missing .owner in framebuffer-coreboot, memconsole-coreboot and vpd
drivers.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (2):
      firmware: coreboot: store owner from modules with coreboot_driver_register()
      firmware: google: cbmem: drop driver owner initialization

 drivers/firmware/google/cbmem.c          | 1 -
 drivers/firmware/google/coreboot_table.c | 6 ++++--
 drivers/firmware/google/coreboot_table.h | 6 +++++-
 3 files changed, 9 insertions(+), 4 deletions(-)
---
base-commit: 7fdcff3312e16ba8d1419f8a18f465c5cc235ecf
change-id: 20240330-module-owner-coreboot-114292b6d11b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

