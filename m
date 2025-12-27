Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7876314B70
	for <chrome-platform@lists.linux.dev>; Sat, 27 Dec 2025 14:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766845509; cv=none; b=FJx6YRKc/5ILC4EveRLQakKNhiDJtJuPvNy6VMdaZS4JCgbC6n1XXaNd3kdr+m4goT22RZw3wH1psMGlbP8/BdqHW4Fkcqf8fx2xUoc2/NkO1KkGxxehfJKT51zssdCYZtmeECyEwP1TLje9mNuBBQgx63WKUhA61qczrS1dVys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766845509; c=relaxed/simple;
	bh=A2NH8q4C7fVPf2dWuZsnLKGtSz5oh/q2W/gIH5638ho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jVsxM4Zt9tAMwmb0XpUKwJgHEGD+ns0dXTsYBrfXd5ezLJSJhd3ODeFwuI1ZQj8Nqty0Ejf9h0EU+NyYJolp2LRIO4w8mu/3d7P3w8pX/uqyBqTOMtXH8KfpfSaHAKuWB6MO+jGFX2HWTr8W74krx+mkA9uo8BD9+aGqFg/qMj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LpGtgtoS; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LpGtgtoS"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7fbbb84f034so5414959b3a.0
        for <chrome-platform@lists.linux.dev>; Sat, 27 Dec 2025 06:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1766845506; x=1767450306; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qG0+ohKiSx95lCPoeRkBaenAF/9dUpbZ87AcJoxqhPo=;
        b=LpGtgtoSYr1iERsAFRS9UABKXd0JHsXRoiiXXAg8NGfDhkr0BJ4gtTNniXoWuS87wB
         imAshMdQ5KkgalFWqb01y3uJjjEPEhcNrsWi7JzRQ2j8v/LmlFDS+VTrFs6gOLFI5WY+
         /ZCpo949CIwi5ZQ9gsYSXGhgWX9ehzUrKpjpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766845506; x=1767450306;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qG0+ohKiSx95lCPoeRkBaenAF/9dUpbZ87AcJoxqhPo=;
        b=HXrm/5bEnQEYIlALVIimMVrBv6MUbe6XLJ5VZULisWfUrnMr07cabTnkaU5BvEczdO
         lSU/rEjnIEaA+6o4f0lahFzDbmcCi9ACw2h7iE9JJYKlcFY1LpXnqCeIIvE6/in9qlXv
         HOHq1HD6lzDLTO0YC+4grC0zlA2hs+yBOY2c0LcmSo3qDJrO5NWHuw+oRvwlIjdPTBxY
         FGH4UkxMwoht7Ay6lgTEJYbxUnlg9pX5MfJKvxNhChc03ZLOFJwNhPzPpUfacWiLSZB7
         7JOALVeF0HZrcFSns3GrH14Qv2VHREevVraLbsDv0CAMHB5ipooAUo9dpBopKp3R254r
         gNAA==
X-Forwarded-Encrypted: i=1; AJvYcCXQHzYkTqc2sde4tCu+LiW6LdKwFuuYn+mzIPmFWJ7FnLt0OyY7Ss8ddUjxb0JIZydnlXaLs+pCMqkuB+hwOqs=@lists.linux.dev
X-Gm-Message-State: AOJu0YwqNCykLQIaSB58s14JO5GA8D1ttxsCaSHQzN5K5iWb17niTE6r
	nNl31jkN4jcEJwXS2OvvLcUZ29fZBEfit7cBvM4c9rBLUUkSMAUaUkvTDmHDZDM2bf4saeryPCj
	RtXwLsrt9NmTjO32HrcdjmGhsc7TPsryGBtZTugLo
X-Gm-Gg: AY/fxX6lKHB8KrrSHdHbyu9gyQjptJkedquygVv10PJ+MjGMs5dFs8Xp6H0OsCW/K2v
	tv77LhkM6mUofo3x2SRBQPoxrTfVBn9EH8plnb8y/hk8pU18u7gh9+K24mxxJzGsz10TNYuu8ke
	re3kz4GXl7XjV6guA2esXThEql9CwQrCRNFfDbgNNLB4SIYI2Z2526l1GLWXv8ijTByHehz4PiP
	zZTeg5VjY0CYuvAQYII2rafoGO1aj3m/k6nmaQS+bVX1pwsUUHnNiq1S4ySVcUMforSFx2j57Tp
	tqXt
X-Google-Smtp-Source: AGHT+IHnEGOmXdjfQsetVVbNG8ehT65yiF1nHmPBkUVYero3HJqeWEGu77h5h3mI6v4oKE3+iSLjngfGXjPOlcDmCo4=
X-Received: by 2002:a05:6a20:72a5:b0:34f:68e9:da94 with SMTP id
 adf61e73a8af0-376a81dcc8fmr24774064637.30.1766845505998; Sat, 27 Dec 2025
 06:25:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251224152238.485415-1-fabiobaltieri@chromium.org> <20251224152238.485415-2-fabiobaltieri@chromium.org>
In-Reply-To: <20251224152238.485415-2-fabiobaltieri@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 27 Dec 2025 07:24:33 -0700
X-Gm-Features: AQt7F2pu5irmQrlelsCWH9CO1JsXgyJlMuIRF8sLAfYATcFturh6KCklaDBGaMQ
Message-ID: <CAFLszThHmN-eGMwwgUhSFbWcbuOYYs-eFh6d6ZVTXekRGv6Hdg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] Input: cros_ec_keyb - add function key support
To: Fabio Baltieri <fabiobaltieri@chromium.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Fabio,

On Wed, 24 Dec 2025 at 08:22, Fabio Baltieri <fabiobaltieri@chromium.org> wrote:
>
> Add support for handling an Fn button and sending separate keycodes for
> a subset of keys in the matrix defined in the upper half of the keymap.
>
> Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
> ---
>  drivers/input/keyboard/cros_ec_keyb.c | 120 ++++++++++++++++++++++----
>  1 file changed, 104 insertions(+), 16 deletions(-)
>

Reviewed-by: Simon Glass <sjg@chromium.org>

I suggest a function comment for the two new functions you add.

> diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
> index 1c6b0461dc35..8b95b4f8a37d 100644
> --- a/drivers/input/keyboard/cros_ec_keyb.c
> +++ b/drivers/input/keyboard/cros_ec_keyb.c
> @@ -29,6 +29,11 @@
>
>  #include <linux/unaligned.h>
>
> +/* Maximum size of the normal key matrix, this is limited by the host command
> + * key_matrix field defined in ec_response_get_next_data_v3
> + */
> +#define CROS_EC_KEYBOARD_COLS_MAX 18
> +
>  /**
>   * struct cros_ec_keyb - Structure representing EC keyboard device
>   *
> @@ -44,6 +49,11 @@
>   * @bs_idev: The input device for non-matrix buttons and switches (or NULL).
>   * @notifier: interrupt event notifier for transport devices
>   * @vdata: vivaldi function row data
> + * @use_fn_overlay: whether the driver use an fn function overlay
> + * @normal_key_status: active normal keys map
> + * @fn_key_status: active function keys map
> + * @fn_key_pressed: tracks the function key status
> + * @fn_key_triggered: tracks where any function key fired
>   */
>  struct cros_ec_keyb {
>         unsigned int rows;
> @@ -61,6 +71,12 @@ struct cros_ec_keyb {
>         struct notifier_block notifier;
>
>         struct vivaldi_data vdata;
> +
> +       bool use_fn_overlay;
> +       u8 normal_key_status[CROS_EC_KEYBOARD_COLS_MAX];
> +       u8 fn_key_status[CROS_EC_KEYBOARD_COLS_MAX];
> +       bool fn_key_pressed;
> +       bool fn_key_triggered;
>  };
>
>  /**
> @@ -166,16 +182,83 @@ static bool cros_ec_keyb_has_ghosting(struct cros_ec_keyb *ckdev, uint8_t *buf)
>         return false;
>  }
>
> +static void cros_ec_keyb_process_fn_key(struct cros_ec_keyb *ckdev,
> +                                       int row, int col, bool state)
> +{
> +       struct input_dev *idev = ckdev->idev;
> +       int pos = MATRIX_SCAN_CODE(row, col, ckdev->row_shift);
> +
> +       ckdev->fn_key_pressed = state;
> +
> +       if (state) {
> +               ckdev->fn_key_triggered = false;
> +       } else if (!ckdev->fn_key_triggered) {
> +               /*
> +                * Send the original code if nothing else has been pressed
> +                * together with Fn.
> +                */
> +               input_event(idev, EV_MSC, MSC_SCAN, pos);
> +               input_report_key(idev, KEY_FN, true);
> +               input_sync(idev);
> +
> +               input_event(idev, EV_MSC, MSC_SCAN, pos);
> +               input_report_key(idev, KEY_FN, false);
> +       }
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
> +       if (ckdev->use_fn_overlay) {
> +               if (code == KEY_FN)
> +                       return cros_ec_keyb_process_fn_key(ckdev, row, col, state);
> +
> +               if (!state) {
> +                       if (ckdev->fn_key_status[col] & BIT(row)) {
> +                               pos = MATRIX_SCAN_CODE(row + ckdev->rows, col, ckdev->row_shift);
> +                               code = keycodes[pos];

You might want a helper to do this as it is repeated below

> +
> +                               ckdev->fn_key_status[col] &= ~BIT(row);
> +                       } else if (ckdev->normal_key_status[col] & BIT(row)) {
> +                               ckdev->normal_key_status[col] &= ~BIT(row);
> +                       } else {
> +                               /* Discard, key press code was not sent */
> +                               return;
> +                       }
> +               } else if (ckdev->fn_key_pressed) {
> +                       pos = MATRIX_SCAN_CODE(row + ckdev->rows, col, ckdev->row_shift);
> +                       code = keycodes[pos];
> +
> +                       ckdev->fn_key_triggered = true;
> +
> +                       if (!code)
> +                               return;
> +
> +                       ckdev->fn_key_status[col] |= BIT(row);
> +               } else {
> +                       ckdev->normal_key_status[col] |= BIT(row);
> +               }
> +       }
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
> @@ -192,20 +275,13 @@ static void cros_ec_keyb_process(struct cros_ec_keyb *ckdev,
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
> -
> -                               input_event(idev, EV_MSC, MSC_SCAN, pos);
> -                               input_report_key(idev, keycodes[pos],
> -                                                new_state);
> -                       }
> +
> +                       if (new_state == old_state)
> +                               continue;
> +
> +                       cros_ec_keyb_process_one(ckdev, row, col, new_state);
>                 }
>                 ckdev->old_kb_state[col] = kb_state[col];
>         }
> @@ -597,12 +673,19 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
>         struct device *dev = ckdev->dev;
>         struct input_dev *idev;
>         const char *phys;
> +       unsigned int rows_keymap;
>         int err;
>
>         err = matrix_keypad_parse_properties(dev, &ckdev->rows, &ckdev->cols);
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
> @@ -635,7 +718,12 @@ static int cros_ec_keyb_register_matrix(struct cros_ec_keyb *ckdev)
>         ckdev->ghost_filter = device_property_read_bool(dev,
>                                         "google,needs-ghost-filter");
>
> -       err = matrix_keypad_build_keymap(NULL, NULL, ckdev->rows, ckdev->cols,
> +       ckdev->use_fn_overlay = device_property_read_bool(dev,
> +                                       "google,use-fn-overlay");
> +
> +       rows_keymap = ckdev->use_fn_overlay ? ckdev->rows * 2 : ckdev->rows;
> +
> +       err = matrix_keypad_build_keymap(NULL, NULL, rows_keymap, ckdev->cols,
>                                          NULL, idev);
>         if (err) {
>                 dev_err(dev, "cannot build key matrix\n");
> --
> 2.52.0.351.gbe84eed79e-goog
>

Regards,
Simon
