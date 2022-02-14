Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00377E4
	for <chrome-platform@lists.linux.dev>; Mon, 14 Feb 2022 05:37:25 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id b64-20020a256743000000b0061e169a5f19so31452959ybc.11
        for <chrome-platform@lists.linux.dev>; Sun, 13 Feb 2022 21:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=+1SwCE06M0PNqBLEJTg15X5eH7+oSoSSFiekI+9wl9s=;
        b=VtTPVXxfex/1ySP2MQUCDrrLGS4bgo8o9gYa4yfPriMLozUesvzfOHPU9JNcSROXnZ
         3PTCEKlwxO3xEnbzXHfcKoos8ott/okgb3eO4UDDb5Hgq0fnhYoRMEpSqFV4Pk277fJ2
         +Nd5BHsBrYrOtYE1oe1F8NmnJOOYyYSzhBm7iowqdEfANVP0pk9K8G9JaIhlJe7ZekSu
         9kpEwoQssXCR1UvrZQT5zNlJ5DF4OJ8uwRFWNzYIWYAWuZKd0QjWbKpL/zmBkd6fQkMq
         a41bVuN0Wgd7EduqWuld4iSyG2TgCW8/AfcO5jxg3moU1H+YUcIzzZAWiUed0xbe9ykr
         0LPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=+1SwCE06M0PNqBLEJTg15X5eH7+oSoSSFiekI+9wl9s=;
        b=TCcFemB1XwEBwnvSzkphFJIkD3vnzMOWJwH4VK/nvX95MH/yPV+FBqtOwbbaj25pvi
         gHSJn9puPN38lut120HM+0uG5Dw/WJ4/WCEONg9NyzXExUNYuD8egAyLEU4wXlSSaaHG
         ooEzHsmb55We0RkLnJU8+qomEDNIrIVtaS5Jhrgcrvn+UupZC+OiRB34v8l0FgRmy9Xz
         bzoIfTETOehcNEwYAzlxPI/4eJrl0QHTa8h60heCjC2ay45vhZakFQxlKjI8XSX8pL8h
         pmIU2Bllj66/JS4XVLOZ7w8SwU0gPejdVO/mZBSlZRY58XvV5s9/klFVB9gqZaYx68B7
         bXkw==
X-Gm-Message-State: AOAM533vIbJOEBqcRj8x4w2fSS+wVGiPvbsbpBDK/MmJ9gvhRac4rx+M
	EgpFlBDEXy6gigmHd+DxfPHfzp4jGA5r
X-Google-Smtp-Source: ABdhPJzLlnCyP8MR7Ka8mTntsMrSfWdMHHSSskLUEwG3JprtOu25ulTVq/KOFZQzyJJoH9evqR6maA8J1aHF
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:10:f315:f92d:e3d3:2539])
 (user=tzungbi job=sendgmr) by 2002:a25:900e:: with SMTP id
 s14mr10446908ybl.338.1644817044881; Sun, 13 Feb 2022 21:37:24 -0800 (PST)
Date: Mon, 14 Feb 2022 13:36:41 +0800
Message-Id: <20220214053646.3088298-1-tzungbi@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.265.g69c8d7142f-goog
Subject: [PATCH 0/5] platform/chrome: cros_kbd_led_backlight: add EC PWM backend
From: Tzung-Bi Shih <tzungbi@google.com>
To: bleung@chromium.org, groeck@chromium.org, robh+dt@kernel.org
Cc: chrome-platform@lists.linux.dev, tzungbi@google.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The series adds EC PWM as an backend option for ChromeOS keyboard LED
backlight.

The 1st patch reorder the headers alphabetically.

The 2nd patch separates the ACPI backend as an independent option.

The 3rd patch is the DT binding document for the proposed compatible string.

The 4th patch supports OF match.

The 5th patch adds EC PWM as another backend option.

Tzung-Bi Shih (5):
  platform/chrome: cros_kbd_led_backlight: sort headers alphabetically
  platform/chrome: cros_kbd_led_backlight: separate ACPI backend
  dt-bindings: add google,cros-kbd-led-backlight
  platform/chrome: cros_kbd_led_backlight: support OF match
  platform/chrome: cros_kbd_led_backlight: support EC PWM backend

 .../chrome/google,cros-kbd-led-backlight.yaml |  35 +++
 .../bindings/mfd/google,cros-ec.yaml          |   3 +
 drivers/platform/chrome/Kconfig               |  14 +-
 .../platform/chrome/cros_kbd_led_backlight.c  | 218 ++++++++++++++++--
 4 files changed, 247 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/chrome/google,cros-kbd-led-backlight.yaml

-- 
2.35.1.265.g69c8d7142f-goog

