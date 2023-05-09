Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FA91990C
	for <chrome-platform@lists.linux.dev>; Tue,  9 May 2023 23:26:05 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-61b5da092dfso30728756d6.0
        for <chrome-platform@lists.linux.dev>; Tue, 09 May 2023 16:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683674764; x=1686266764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GMrHpqzyo/nRqaoDg7frzx0vWaNYIfXyIe54Jr4ICn4=;
        b=f2Zx5DXhRLQikv8viYBkJO4PRE5axGyYTAZDu0iB/DegIbdbFdYihLD93fJ858piaE
         UjKIpzcENStT/DN7xYE7ABiu1UUWJAmKvnJcEJabhfnyN1n2iY4kSKJhZT4DLdC6qHj8
         4dlOy9hURMw6T1gvgkzrV/YSdLm2Zva38edeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683674764; x=1686266764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GMrHpqzyo/nRqaoDg7frzx0vWaNYIfXyIe54Jr4ICn4=;
        b=H9IMumpumH6L6j2w7agkiV8iUZKu2tNRrLgVmxo82W0aGPOJ7yRxurgNm61WLaA9Io
         QkSUk8Hbkt9IxhU4NRWLMNzpjIzybveuFLKA30T0fbJEUorsb25g2Cnltc8yQRSQZbj5
         3Oy/B5NRTYYm/NjSoihGwK8segMBpA0KboGmv24qcTW/O8DEhW55ybpK0Oreic60Nqq6
         PqVb3wsb7JUqtER/8QzIWSSZ0DhexrvdwEVjDCf6NMQeiypx46SdzeDsB2xhQ+W+6C65
         jiqKBRI9Iob8YdVfi96/KOrTD9EX73l1WBHcT+SGc9FIHXB8957BypfDKSP5nIzXQTDV
         9ZWA==
X-Gm-Message-State: AC+VfDxfI0jAZdI8VLSBHERaAZUCsE1ku/cn+Z+TXTqy3LgYXJwGxJ+d
	MXixZkzfn3hZCyjohYS/Nbvai3SNvRR4RwCGqIkzRXqK043M+4Kc
X-Google-Smtp-Source: ACHHUZ7ctFcR+cULSerySrCaKELEj4ujmEX3/LQXtKDbk2c4IMKXEM92k+2Bp8BnCM7GETE0AEjbsEU9enAkm2SYHyA=
X-Received: by 2002:a05:6214:485:b0:619:ff0c:9246 with SMTP id
 pt5-20020a056214048500b00619ff0c9246mr23815475qvb.34.1683674764372; Tue, 09
 May 2023 16:26:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACeCKafE3c+ie7_hHQnKpcRqV_n34oL3O3JfUNXoBUDTdTmQow@mail.gmail.com>
 <20230509231906.3118230-1-robbarnes@google.com>
In-Reply-To: <20230509231906.3118230-1-robbarnes@google.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Tue, 9 May 2023 16:25:53 -0700
Message-ID: <CACeCKac5HVUrFUdOFqwADuaBPOewJHJZeJ30h4iz42VMhbX+UQ@mail.gmail.com>
Subject: Re: [PATCH v3] platform/chrome: cros_ec: Report EC panic as uevent
To: Rob Barnes <robbarnes@google.com>
Cc: chrome-platform@lists.linux.dev, dnojiri@chromium.org, tzungbi@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 9, 2023 at 4:19=E2=80=AFPM Rob Barnes <robbarnes@google.com> wr=
ote:
>
> iCreate a uevent when an EC panic is detected. This will allow udev rules

Looks like a typo slipped through :/
