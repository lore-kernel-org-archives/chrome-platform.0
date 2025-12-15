Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30722D77E6
	for <chrome-platform@lists.linux.dev>; Mon, 15 Dec 2025 13:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765804170; cv=none; b=bXQKOBGvBcDDFtiLReZp01IiwOm1511UlnmVG+/5mtSsgSoYFzLG2iSS/wbL++WwMOQbIaAelRx3fnRrLx+ToZh5oX4cVqUEa8LTv2/6hbTl5K8ea0znfF1prpZQcuwEUb+5gayV7qMH3T7ehGOzghvOoY4kC8LAa9Nwi5SLvQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765804170; c=relaxed/simple;
	bh=htT2w6l3gT1BhEWxPoOuIIkxt113epopi+xlKxAqEYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PWj9Yu8pS6r9Zn9DiOpcu0/s6TC/Pa/PiGvHTgCDrHMgSDfx+LwYGnBnKo1gQxbTrBrorNy/BAmRMTgByilsXpQTblZky665OtfjDrPaXAP8snka2zrItOSqGlCleWqWCHLLm2Zay2d0hviU8Ir24P3hNFHY0VXW5Py/bR3KDi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Lns5CA7a; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Lns5CA7a"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-430f2ee2f00so760686f8f.3
        for <chrome-platform@lists.linux.dev>; Mon, 15 Dec 2025 05:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765804167; x=1766408967; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M4qyctUX7vU1W8pSxvEcJ1tR+43BtQPWPVTKPDH9E2M=;
        b=Lns5CA7aAidnyrHiqLILantcIOmc4f3aMWatpCN+Mi7gsogvBOqJKzTh+9pfTW1jbw
         tlCkkjzNRHSMezUJl1rZY9baPKYD6ueIyjEK50FqKaF+d7Ho02TyqXvo2G3UYHIKlk20
         u3//CKTT6puYfnka0TAvHk4MRYnZtmJfe8jOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765804167; x=1766408967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M4qyctUX7vU1W8pSxvEcJ1tR+43BtQPWPVTKPDH9E2M=;
        b=xUUuv+VIBAIkuDZg7qHwA0mwdq/wTq1giZ8+BBQpeAFv0NJIgaOCpICVBA1nQwCb/U
         aFzTTuryeMHMUq03muLAkwQy6MiJB17pX9pVR4kjxUlj+9LVx6ymXHbw/8y8GwiKymgr
         GioIxgF1Jbsg+jxQS0K4r+X5EC5KR3JsXNfGjv0JbCV1l8+yF6j7bFvCNK3DyafIJs6T
         Cy3xgoVr6RK2/u+SkIqaYEYPHAoN6CJmZbtithxDTdUm5OYVi58H94EHnAIaGv1ME5ru
         6yzyKKV7D5B4oJprPjyOrIMzKrWdUR7qJ/lKJXqzOof6LiqV4P3kWEYGAxdcxdQfQleh
         Rm+g==
X-Forwarded-Encrypted: i=1; AJvYcCV57Zhc6kERAw8M5rOR0oAJUg6jFEtw421B8vjxa/sC8FNOoC+73FziLlNCkC0IPUmx2KsW4YdqMsEoVwT3zI8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5T4FCktgESwdJk1i+NaNgLceRc7xztoq9NuATZzjinlwjqJZM
	qJznn9U37Gzar8iQ3+D/31wuvN61Mwq8lGtXqJdQC3L7E/Nw3PGl0rRCr0EynC6p5g==
X-Gm-Gg: AY/fxX4mYtbOeQqeF7XtF5dUugUcB8Tk+ytt8AwAUBsu8fqcNZwYjUUJCIV6i0L/z+7
	/EffFFgfYKqPIKNMuQMLb7t+KMX8AMNP7c4IiCF3wSbPUZiHjJl74gbn53fIQnfSgbmYjRyvxjW
	RTSixYqDgSoqaJ6gTse/Hs0HTxOMBIu53Q9Q9bqRlNzUF9OqRTKdSGH7uU1OwsFueVY8DiYOmBO
	v5eRYWKKT0ZFuUVDoIbaDg1K1KrSE9Vf2wJIuWCecdCP6QlSAOYApF7BodHv4r2Vy3DKtrdVdX0
	ksNx9TzmEd2XIQogi3xskGtgzqEu7wIum1snnOIG1iXvxZmo/F7BTQ83X5E/xuBjBAcPz81O9JH
	7lP0a13PgJs3EJvWZG4tBY8d1Hzw8EsIIIw+2UkxFATLw4Z0ERsXVmkBtgx+y/15yYzeyLx6MRw
	Cj4HkgCLFMG5y75nMARQ==
X-Google-Smtp-Source: AGHT+IHxUjIM6pOJsp7j/o99Vq4T5LCbQu9SoxxJURH/po4ld/NsNTEpHIlESpdoGRU4OR27kBc92g==
X-Received: by 2002:a05:6000:4383:b0:430:f182:788f with SMTP id ffacd0b85a97d-430f1827ae9mr8904843f8f.21.1765804167048;
        Mon, 15 Dec 2025 05:09:27 -0800 (PST)
Received: from google.com ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f6e78a7csm11582854f8f.34.2025.12.15.05.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 05:09:26 -0800 (PST)
Date: Mon, 15 Dec 2025 13:09:24 +0000
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Simon Glass <sjg@chromium.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] Input: cros_ec_keyb: add function key support
Message-ID: <aUAIhNMTPQVl3b4W@google.com>
References: <20251209154706.529784-1-fabiobaltieri@chromium.org>
 <20251209154706.529784-3-fabiobaltieri@chromium.org>
 <CAFLszThUU4hfb4vY4mmGHQadRKThG3e=9cAKRy_ampKwA_XNcA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFLszThUU4hfb4vY4mmGHQadRKThG3e=9cAKRy_ampKwA_XNcA@mail.gmail.com>

Hey Simon,

On Thu, Dec 11, 2025 at 06:29:01AM -0700, Simon Glass wrote:
> > @@ -44,6 +52,13 @@
> >   * @bs_idev: The input device for non-matrix buttons and switches (or NULL).
> >   * @notifier: interrupt event notifier for transport devices
> >   * @vdata: vivaldi function row data
> > + * @fn_key: coordinate of the function key
> > + * @fn_keymap: array of coordinate and codes for the function keys
> > + * @fn_keymap_len: number of entries in the fn_keymap array
> > + * @fn_key_status: active function keys bitmap
> > + * @normal_key_status: active normal keys bitmap
> > + * @fn_key_pressed: tracks the function key status
> > + * @fn_key_triggered: tracks where any function key fired
> >   */
> >  struct cros_ec_keyb {
> >         unsigned int rows;
> > @@ -61,6 +76,14 @@ struct cros_ec_keyb {
> >         struct notifier_block notifier;
> >
> >         struct vivaldi_data vdata;
> > +
> > +       uint32_t fn_key;
> 
> Normally we use u32/u8 these days

Okay, I did notice the file was a bit of a mix, I'll change them in v2.

> 
> > +       uint32_t *fn_keymap;
> > +       int fn_keymap_len;
> > +       uint32_t fn_key_status;
> > +       uint8_t normal_key_status[CROS_EC_KEYBOARD_COLS_MAX];
> > +       bool fn_key_pressed;
> > +       bool fn_key_triggered;
> >  };
> >
> >  /**
> > @@ -166,16 +189,108 @@ static bool cros_ec_keyb_has_ghosting(struct cros_ec_keyb *ckdev, uint8_t *buf)
> >         return false;
> >  }
> >
> > +static bool cros_ec_key_is(int row, int col, uint32_t key)
> > +{
> > +       if (row == KEY_ROW(key) && col == KEY_COL(key))
> > +               return true;
> > +
> > +       return false;
> > +}
> > +
> > +static void cros_ec_keyb_process_one(struct cros_ec_keyb *ckdev,
> > +                                    int row, int col, bool state)
> > +{
> > +       struct input_dev *idev = ckdev->idev;
> > +       const unsigned short *keycodes = idev->keycode;
> > +       int pos = MATRIX_SCAN_CODE(row, col, ckdev->row_shift);
> > +       unsigned int code = keycodes[pos];
> > +
> > +       dev_dbg(ckdev->dev, "changed: [r%d c%d]: byte %02x\n", row, col, state);
> > +
> > +       if (ckdev->fn_keymap) {
> > +               if (cros_ec_key_is(row, col, ckdev->fn_key)) {
> > +                       ckdev->fn_key_pressed = state;
> > +
> > +                       if (state) {
> > +                               ckdev->fn_key_triggered = false;
> > +                       } else if (!ckdev->fn_key_triggered) {
> > +                               /*
> > +                                * Send the original code if nothing else has
> > +                                * been pressed together with Fn.
> > +                                */
> > +                               input_event(idev, EV_MSC, MSC_SCAN, pos);
> > +                               input_report_key(idev, code, true);
> > +                               input_sync(ckdev->idev);
> 
> What is this function? I might be missing a patch?

input_sync? it sends an EV_SYN, been there from the start, though I
noticed I miss one two lines below, was relying on the rest of the
function to send it but I changed the logic at some point and broke that
path, will fix that.

> 
> > +
> > +                               input_event(idev, EV_MSC, MSC_SCAN, pos);
> > +                               input_report_key(idev, code, false);
> > +                       }
> > +
> > +                       return;
> > +               }
> > +
> > +               if (!state) {
> > +                       /* Key release, may need to release the Fn code */
> > +                       for (int i = 0; i < ckdev->fn_keymap_len; i++) {
> > +                               if (!cros_ec_key_is(row, col,
> > +                                                   ckdev->fn_keymap[i]))
> > +                                       continue;
> > +
> > +                               if ((ckdev->fn_key_status & BIT(i)) == 0)
> > +                                       continue;
> > +
> > +                               code = KEY_VAL(ckdev->fn_keymap[i]);
> > +                               ckdev->fn_key_status &= ~BIT(i);
> > +
> > +                               input_event(idev, EV_MSC, MSC_SCAN, pos);
> > +                               input_report_key(idev, code, state);
> > +
> > +                               return;
> > +                       }
> > +
> > +                       if ((ckdev->normal_key_status[col] & BIT(row)) == 0)
> > +                               /* Discard, key press code was not sent */
> > +                               return;
> > +               } else if (ckdev->fn_key_pressed) {
> > +                       /* Key press while holding Fn */
> > +                       ckdev->fn_key_triggered = true;
> > +
> > +                       for (int i = 0; i < ckdev->fn_keymap_len; i++) {
> > +                               if (!cros_ec_key_is(row, col,
> > +                                                   ckdev->fn_keymap[i]))
> > +                                       continue;
> > +
> > +                               code = KEY_VAL(ckdev->fn_keymap[i]);
> > +                               ckdev->fn_key_status |= BIT(i);
> > +
> > +                               input_event(idev, EV_MSC, MSC_SCAN, pos);
> > +                               input_report_key(idev, code, state);
> > +
> > +                               return;
> > +                       }
> > +
> > +                       /* Do not emit a code if the key is not mapped */
> > +                       return;
> > +               }
> > +       }
> 
> I think this function could do with splitting a bit

Yeah, I don't love it either but there's a lot of logic intertwined in
there, tried to split it myself and ended up breaking stuff, the logic
for the fn key itsel though can go that's a good 16 lines, I'll start
with that, send a v2 and then go from there.

> Can the sandbox driver support this too?

Not sure what you are referring to, can you give me a pointer?

Hey thanks for the review, good to hear from you. :-)

Cheers,
Fabio

-- 
Fabio Baltieri
