Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37577E4
	for <chrome-platform@lists.linux.dev>; Mon, 14 Feb 2022 05:37:38 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id q11-20020a252a0b000000b0061e240c8fb3so28231042ybq.22
        for <chrome-platform@lists.linux.dev>; Sun, 13 Feb 2022 21:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=DQT1njARcAhQIihUotwILwK0baqFsKzs/qdOQYfjv+Y=;
        b=oMvKMnKWvbRtr0l3jGrkdm9p29tjSHtw95L8IvCbwaufLdZ58bkWoR/MIAGbmxIDNO
         74swf8EoSGgOIV9tdjWYPg8p+3lenYCFrs0vZKplemvO4UvcORH+n7Mhy+auqOZ2vd+q
         otqKjMDl2eS/6jYwLKo+yju3h1BsAX6WnMrB5qCjKGSBqKss8Kmt66ve3GtbSFvd/EQx
         4PRLsvvjRxehPpufJfqfekjZmzEU4ob0pYTOPHlv1OZFMkkIq+tJA534UOpV769Gbzt3
         NRdZv8XhxXniBv858yKjIfAMxqOwVLivC2/NjUtdoi88OfxIBEXVGAUKzLRru1X+KCHg
         OQxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=DQT1njARcAhQIihUotwILwK0baqFsKzs/qdOQYfjv+Y=;
        b=SpOxag6WQr+aysogRyw7S3FbOoegHqINE+SANtE5kbxorsaOrIYcHPMouOviqXqix6
         Mmhj3hUtdoHI1oh0LKYPMsmC+JOJh7Gf0GjQvCNfjc1uHyO6iv7/nAW3TdDRVz6YXNnF
         ySk0dwJ4S8b1Z69fyNYpbv7fof0YUoIhRXLRUF8TGl04/LsseZmXU42ktMMnhq9HJ/ui
         mcoJhKRW2eLZgtj9xjhUpL0N8es55t5sDi52e8/GgDsyRK2ltjORrrP6aLLh/GMgI+hc
         X+yFCUfyLqzA3IKsUqmiauv3Rm2GfdTMSDRoZjtF2nW4/wfdA3BVKxly4A/344Iw3KnQ
         SJRg==
X-Gm-Message-State: AOAM5337AGGv6CBllPa0VEz49zBwjww6PKRdtJdTC3NjdTu9+H/KWBkr
	MNoMq+r/iSU7hUBxMRJQoZUrilzbbjrQ
X-Google-Smtp-Source: ABdhPJxOzKq6UNR5brAsM1MXIf51Dq60vdHRApus/HRyC/6Y4e0TFqZsk5zbI7Qfdjv+7pQmG53gsfD841a+
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:10:f315:f92d:e3d3:2539])
 (user=tzungbi job=sendgmr) by 2002:a81:a391:: with SMTP id
 a139mr12318940ywh.432.1644817057814; Sun, 13 Feb 2022 21:37:37 -0800 (PST)
Date: Mon, 14 Feb 2022 13:36:44 +0800
In-Reply-To: <20220214053646.3088298-1-tzungbi@google.com>
Message-Id: <20220214053646.3088298-4-tzungbi@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220214053646.3088298-1-tzungbi@google.com>
X-Mailer: git-send-email 2.35.1.265.g69c8d7142f-goog
Subject: [PATCH 3/5] dt-bindings: add google,cros-kbd-led-backlight
From: Tzung-Bi Shih <tzungbi@google.com>
To: bleung@chromium.org, groeck@chromium.org, robh+dt@kernel.org
Cc: chrome-platform@lists.linux.dev, tzungbi@google.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../chrome/google,cros-kbd-led-backlight.yaml | 35 +++++++++++++++++++
 .../bindings/mfd/google,cros-ec.yaml          |  3 ++
 2 files changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/chrome/google,cros-kbd-led-backlight.yaml

diff --git a/Documentation/devicetree/bindings/chrome/google,cros-kbd-led-backlight.yaml b/Documentation/devicetree/bindings/chrome/google,cros-kbd-led-backlight.yaml
new file mode 100644
index 000000000000..104299e09cbb
--- /dev/null
+++ b/Documentation/devicetree/bindings/chrome/google,cros-kbd-led-backlight.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/chrome/google,cros-kbd-led-backlight.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ChromeOS keyboard backlight LED driver.
+
+maintainers:
+  - Tzung-Bi Shih <tzungbi@google.com>
+
+properties:
+  compatible:
+    const: google,cros-kbd-led-backlight
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    spi0 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      cros_ec: ec@0 {
+        compatible = "google,cros-ec-spi";
+        reg = <0>;
+
+        kbd-led-backlight {
+          compatible = "google,cros-kbd-led-backlight";
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
index d1f53bd449f7..1815ca0e8ebc 100644
--- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
+++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
@@ -90,6 +90,9 @@ properties:
   ec-pwm:
     $ref: "/schemas/pwm/google,cros-ec-pwm.yaml#"
 
+  kbd-led-backlight:
+    $ref: "/schemas/chrome/google,cros-kbd-led-backlight.yaml#"
+
   keyboard-controller:
     $ref: "/schemas/input/google,cros-ec-keyb.yaml#"
 
-- 
2.35.1.265.g69c8d7142f-goog

