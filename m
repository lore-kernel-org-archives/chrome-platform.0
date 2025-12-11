Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A397330498D
	for <chrome-platform@lists.linux.dev>; Thu, 11 Dec 2025 13:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765459758; cv=none; b=IOdkHcy+2OQesLnMR2ccRJraG2nKKi2Qk3eLqe5V6WYgScxvg79CdydXRLCwH9tkraCw2RdiwRsv07k9pCiYx7WafOVlw4uz62KJm3LDkZpigUWuXb6fBuCT2G8RDUPrAmrxyMc1TngQHC1PvMlCOKYKzOBUnFctBJ8LuQmpxYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765459758; c=relaxed/simple;
	bh=GC52vdlrMOCjvAl4e8rzaU0FUykCrlzn0zAFAvejcPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pVEsA/OJ1wrz7k1m8gwZuWTnSnrFsnMjPiaDtGNz1xEB4zMGMzDXcLzwM/S5bipGS9E0ZlfFo0A9ytkrRWHcUk41NqFhpGNt/iLNY7Mpi2/Auu4Newg3p2H2plPNUHMmc6sN2umVd/cW+HNawIZVZIyHM925IWiM/Z+8p62Znws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TXa8F0EI; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TXa8F0EI"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-64312565c10so119993a12.2
        for <chrome-platform@lists.linux.dev>; Thu, 11 Dec 2025 05:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765459755; x=1766064555; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iZd9JSxTLfqAEQ8kerPa/TuPf6DF4xFDdQfs8AMcfNc=;
        b=TXa8F0EIvhWfOcg6I8iHuHP0PmgzEv3ZR6fGXOa5z3zM+fnYEk1y3z9nOGG+CoSVbm
         /H1Ov9E5UXS6lAlLbmuEmTWNmyFyw7OSx6Ubo2NLqHzpX75uunwZ5as65j0uPF4UwfIP
         g8lgyXJ9LTbA6M/InLirGd+7Kq1JaPDfPiMB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765459755; x=1766064555;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iZd9JSxTLfqAEQ8kerPa/TuPf6DF4xFDdQfs8AMcfNc=;
        b=M0AxQT6CON8Rpg+b37Z3XiDJuQdcaclB1e9osNabgISQ1Z+Fbyj34SCmg8dRo3QMAQ
         UmbCxkRsLAz65Kdj+QKWVoEMqnVWVBSCSUerOt2gQ5Kd9jD2HRgkqYws2IeVhEHYyuLl
         7YgL0Zh9RCbzbnSJqp8p7VQ1rfz095Vvwz9J/Ypxrk3/Pf9BGalRUN56iLgovcFvEHk2
         OFJe77yE5qLmTLHjN09aJkwSgblXQVl9nOAAQrbqqh++sksXJuy3qYI8a3qLv+LYF0Nk
         dSHFYZlszPaYTZts8TvLXpG5HZ5FXsXGFlEVG6Wz8ewexlFGqc9tG/4lydSrCjxT9S07
         VQsQ==
X-Forwarded-Encrypted: i=1; AJvYcCU50O9N5SnB5eu5zD3ODDGWEf1vNx/9OoZr4KYgUl/MKJ8TOdT76LtViBFbekPKQUseef5RlqQXPsXqCA/5gM4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzV4oayGbWqYnHH56Ee0pwcIk0fkGLLliaQyB2Dkr6j2m15/cs6
	Sa5EfjwdDheIC9HZnO73mT5r4Dzgf3a0P36GOWG3QIJbrHDZUGtHnopUfFPuZVhGoDnW6w4sVdx
	yfnab18F/PJ+CkxJycqip0G2Z2Y60uduCIXr9ToXw
X-Gm-Gg: AY/fxX62KBobbkiztrE6DmgbTMkFkz0NAlTydXjljkhVicsJq/dH3gHek8y7DGwdw+u
	9NOEqvy6/qBTgSY5FRZpRVu/s8+E6XaLGOp0PmXctM9BaoPbdNdTqowWKbAZ8MhR7FUwPAdrViT
	D721QQvsX+d/Mln0rYbKfjGHkqLZr6UWskoq+FZI0ibeRFlG2Yi5nI906h8IEdLHP98RUi8B/Aw
	bM8XVZLuigCH5gMkDMusYMHNpZqGYW21k0orNx8jacPDBNPS2r++HCipzLWiVBkOjSgenGI9zWL
	i+TE
X-Google-Smtp-Source: AGHT+IEuv3tebhZIRlzQWAPBE+dSHTINZTdfGtZ3PA3haPFLoHb5OV390vNmFdrv9z8I1+SlzrtdMYHkubaZaYo7/sU=
X-Received: by 2002:a05:6402:3508:b0:641:1d64:8dce with SMTP id
 4fb4d7f45d1cf-6496cbc4315mr5231506a12.17.1765459754896; Thu, 11 Dec 2025
 05:29:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251209154706.529784-1-fabiobaltieri@chromium.org> <20251209154706.529784-3-fabiobaltieri@chromium.org>
In-Reply-To: <20251209154706.529784-3-fabiobaltieri@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 11 Dec 2025 06:29:01 -0700
X-Gm-Features: AQt7F2qBWeYaN0u_VBKcb-i_m0I-6rgQQIPctWT0S1pBtt7pqVSJ69wvkHmUQvk
Message-ID: <CAFLszThUU4hfb4vY4mmGHQadRKThG3e=9cAKRy_ampKwA_XNcA@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] Input: cros_ec_keyb: add function key support
To: Fabio Baltieri <fabiobaltieri@chromium.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.orga
Content-Type: text/plain; charset="UTF-8"

Hi Fabio!

On Tue, 9 Dec 2025 at 08:47, Fabio Baltieri <fabiobaltieri@chromium.org> wrote:
>
> Add support for handling an Fn button and sending separate keycodes for
> a subset of keys in the matrix.
>
> Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
> ---
>  drivers/input/keyboard/cros_ec_keyb.c | 190 ++++++++++++++++++++++++--
>  1 file changed, 176 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
> index 2822c592880b..b0965e5d20de 100644
> --- a/drivers/input/keyboard/cros_ec_keyb.c
> +++ b/drivers/input/keyboard/cros_ec_keyb.c
> @@ -29,6 +29,14 @@
>
>  #include <linux/unaligned.h>
>
> +/* Maximum number of Fn keys, limited by the key status mask size. */
> +#define CROS_EC_FN_KEYMAP_MAX 32
> +
> +/* Maximum size of the normal key matrix, this is limited by the host command
> + * key_matrix field defined in ec_response_get_next_data_v3
> + */
> +#define CROS_EC_KEYBOARD_COLS_MAX 18
> +
>  /**
>   * struct cros_ec_keyb - Structure representing EC keyboard device
>   *
> @@ -44,6 +52,13 @@
>   * @bs_idev: The input device for non-matrix buttons and switches (or NULL).
>   * @notifier: interrupt event notifier for transport devices
>   * @vdata: vivaldi function row data
> + * @fn_key: coordinate of the function key
> + * @fn_keymap: array of coordinate and codes for the function keys
> + * @fn_keymap_len: number of entries in the fn_keymap array
> + * @fn_key_status: active function keys bitmap
> + * @normal_key_status: active normal keys bitmap
> + * @fn_key_pressed: tracks the function key status
> + * @fn_key_triggered: tracks where any function key fired
>   */
>  struct cros_ec_keyb {
>         unsigned int rows;
> @@ -61,6 +76,14 @@ struct cros_ec_keyb {
>         struct notifier_block notifier;
>
>         struct vivaldi_data vdata;
> +
> +       uint32_t fn_key;

Normally we use u32/u8 these days

> +       uint32_t *fn_keymap;
> +       int fn_keymap_len;
> +       uint32_t fn_key_status;
> +       uint8_t normal_key_status[CROS_EC_KEYBOARD_COLS_MAX];
> +       bool fn_key_pressed;
> +       bool fn_key_triggered;
>  };
>
>  /**
> @@ -166,16 +189,108 @@ static bool cros_ec_keyb_has_ghosting(struct cros_ec_keyb *ckdev, uint8_t *buf)
>         return false;
>  }
>
> +static bool cros_ec_key_is(int row, int col, uint32_t key)
> +{
> +       if (row == KEY_ROW(key) && col == KEY_COL(key))
> +               return true;
> +
> +       return false;
> +}
> +
> +static void cros_ec_keyb_process_one(struct cros_ec_keyb *ckdev,
> +                                    int row, int col, bool state)
> +{
> +       struct input_dev *idev = ckdev->idev;
> +       const unsigned short *keycodes = idev->keycode;
> +       int pos = MATRIX_SCAN_CODE(row, col, ckdev->row_shift);
> +       unsigned int code = keycodes[pos];
> +
> +       dev_dbg(ckdev->dev, "changed: [r%d c%d]: byte %02x\n", row, col, state);
> +
> +       if (ckdev->fn_keymap) {
> +               if (cros_ec_key_is(row, col, ckdev->fn_key)) {
> +                       ckdev->fn_key_pressed = state;
> +
> +                       if (state) {
> +                               ckdev->fn_key_triggered = false;
> +                       } else if (!ckdev->fn_key_triggered) {
> +                               /*
> +                                * Send the original code if nothing else has
> +                                * been pressed together with Fn.
> +                                */
> +                               input_event(idev, EV_MSC, MSC_SCAN, pos);
> +                               input_report_key(idev, code, true);
> +                               input_sync(ckdev->idev);

What is this function? I might be missing a patch?

> +
> +                               input_event(idev, EV_MSC, MSC_SCAN, pos);
> +                               input_report_key(idev, code, false);
> +                       }
> +
> +                       return;
> +               }
> +
> +               if (!state) {
> +                       /* Key release, may need to release the Fn code */
> +                       for (int i = 0; i < ckdev->fn_keymap_len; i++) {
> +                               if (!cros_ec_key_is(row, col,
> +                                                   ckdev->fn_keymap[i]))
> +                                       continue;
> +
> +                               if ((ckdev->fn_key_status & BIT(i)) == 0)
> +                                       continue;
> +
> +                               code = KEY_VAL(ckdev->fn_keymap[i]);
> +                               ckdev->fn_key_status &= ~BIT(i);
> +
> +                               input_event(idev, EV_MSC, MSC_SCAN, pos);
> +                               input_report_key(idev, code, state);
> +
> +                               return;
> +                       }
> +
> +                       if ((ckdev->normal_key_status[col] & BIT(row)) == 0)
> +                               /* Discard, key press code was not sent */
> +                               return;
> +               } else if (ckdev->fn_key_pressed) {
> +                       /* Key press while holding Fn */
> +                       ckdev->fn_key_triggered = true;
> +
> +                       for (int i = 0; i < ckdev->fn_keymap_len; i++) {
> +                               if (!cros_ec_key_is(row, col,
> +                                                   ckdev->fn_keymap[i]))
> +                                       continue;
> +
> +                               code = KEY_VAL(ckdev->fn_keymap[i]);
> +                               ckdev->fn_key_status |= BIT(i);
> +
> +                               input_event(idev, EV_MSC, MSC_SCAN, pos);
> +                               input_report_key(idev, code, state);
> +
> +                               return;
> +                       }
> +
> +                       /* Do not emit a code if the key is not mapped */
> +                       return;
> +               }
> +       }

I think this function could do with splitting a bit

> +
> +       if (state)
> +               ckdev->normal_key_status[col] |= BIT(row);
> +       else
> +               ckdev->normal_key_status[col] &= ~BIT(row);
> +
> +       input_event(idev, EV_MSC, MSC_SCAN, pos);
> +       input_report_key(idev, code, state);
> +}
>
>  /*
>   * Compares the new keyboard state to the old one and produces key
> - * press/release events accordingly.  The keyboard state is 13 bytes (one byte
> - * per column)
> + * press/release events accordingly.  The keyboard state is one byte
> + * per column.
>   */
>  static void cros_ec_keyb_process(struct cros_ec_keyb *ckdev,
>                          uint8_t *kb_state, int len)
>  {
> -       struct input_dev *idev = ckdev->idev;
>         int col, row;
>         int new_state;
>         int old_state;
> @@ -192,20 +307,13 @@ static void cros_ec_keyb_process(struct cros_ec_keyb *ckdev,
>
>         for (col = 0; col < ckdev->cols; col++) {
>                 for (row = 0; row < ckdev->rows; row++) {
> -                       int pos = MATRIX_SCAN_CODE(row, col, ckdev->row_shift);
> -                       const unsigned short *keycodes = idev->keycode;
> -
>                         new_state = kb_state[col] & (1 << row);
>                         old_state = ckdev->old_kb_state[col] & (1 << row);
> -                       if (new_state != old_state) {
> -                               dev_dbg(ckdev->dev,
> -                                       "changed: [r%d c%d]: byte %02x\n",
> -                                       row, col, new_state);
>
> -                               input_event(idev, EV_MSC, MSC_SCAN, pos);
> -                               input_report_key(idev, keycodes[pos],
> -                                                new_state);
> -                       }
> +                       if (new_state == old_state)
> +                               continue;
> +
> +                       cros_ec_keyb_process_one(ckdev, row, col, new_state);
>                 }
>                 ckdev->old_kb_state[col] = kb_state[col];
>         }
> @@ -604,6 +712,12 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
>         if (err)
>                 return err;
>
> +       if (ckdev->cols > CROS_EC_KEYBOARD_COLS_MAX) {
> +               dev_err(dev, "keypad,num-columns too large: %d (max: %d)\n",
> +                       ckdev->cols, CROS_EC_KEYBOARD_COLS_MAX);
> +               return -EINVAL;
> +       }
> +
>         ckdev->valid_keys = devm_kzalloc(dev, ckdev->cols, GFP_KERNEL);
>         if (!ckdev->valid_keys)
>                 return -ENOMEM;
> @@ -660,6 +774,47 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
>         return 0;
>  }
>
> +static int cros_ec_keyb_register_fn_keys(struct cros_ec_keyb *ckdev)
> +{
> +       struct device *dev = ckdev->dev;
> +       uint32_t fn_key;
> +       uint32_t *keymap;
> +       int keymap_len;
> +       int ret;
> +
> +       if (!(device_property_present(dev, "fn-key") &&
> +             device_property_present(dev, "fn-keymap")))
> +               return 0;
> +
> +       device_property_read_u32(dev, "fn-key", &fn_key);
> +
> +       keymap_len = device_property_count_u32(ckdev->dev, "fn-keymap");
> +       if (keymap_len > CROS_EC_FN_KEYMAP_MAX) {
> +               dev_err(dev, "fn-keymap too large: %d limit=%d",
> +                       keymap_len, CROS_EC_FN_KEYMAP_MAX);
> +               return -EINVAL;
> +       }
> +
> +       keymap = devm_kcalloc(dev, keymap_len, sizeof(*keymap), GFP_KERNEL);
> +       if (!keymap)
> +               return -ENOMEM;
> +
> +       ret = device_property_read_u32_array(dev, "fn-keymap", keymap, keymap_len);
> +       if (ret) {
> +               dev_err(dev, "failed to read fn-keymap property: %d\n", ret);
> +               return ret;
> +       }
> +
> +       for (int i = 0; i < keymap_len; i++)
> +               __set_bit(KEY_VAL(keymap[i]), ckdev->idev->keybit);
> +
> +       ckdev->fn_key = fn_key;
> +       ckdev->fn_keymap = keymap;
> +       ckdev->fn_keymap_len = keymap_len;
> +
> +       return 0;
> +}
> +
>  static ssize_t function_row_physmap_show(struct device *dev,
>                                          struct device_attribute *attr,
>                                          char *buf)
> @@ -734,6 +889,13 @@ static int cros_ec_keyb_probe(struct platform_device *pdev)
>                                 err);
>                         return err;
>                 }
> +
> +               err = cros_ec_keyb_register_fn_keys(ckdev);
> +               if (err) {
> +                       dev_err(dev, "cannot register fn-keys inputs: %d\n",
> +                               err);
> +                       return err;
> +               }
>         }
>
>         err = cros_ec_keyb_register_bs(ckdev, buttons_switches_only);
> --
> 2.52.0.223.gf5cc29aaa4-goog
>

Can the sandbox driver support this too?

Regards,
Simon
