Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6608295DAC
	for <chrome-platform@lists.linux.dev>; Mon,  9 Feb 2026 15:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770651985; cv=none; b=qWYeDE+9dK6YM2BKR5QJrdaoSJGb7krQttlFtS/3GuxTDba+h80cgCjFiNLw+w85CziOLKdJDuY77InhNujr300p9TlLqTgOAIYxr+McEFDykKVyYzNCEm8lyPPiviav1yI4rB8R1XaoESsiIXSo392QzIXbIPLIRg39Nj80EAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770651985; c=relaxed/simple;
	bh=BQP5wFwpOvdeiKxsljvkFx07KLkQSd0sCeO/pfnSkpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aoF/nCO8SuRbwEbyd86xMVBhc1wTKPgAgE0eMMN8OESWsV/gEmq3ZWn/kIGgy91KU8zT62KJ5jY0O9839tPVqpj2p0KmrMLKPzbdFagGVPrdIMNMBh+tGNMeu4XtEMn+gmY7OiXFI1NwbTmyESI95bWH5drFFaf4z/kD6AV12BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=b0ZErFJ3; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="b0ZErFJ3"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so43510965e9.0
        for <chrome-platform@lists.linux.dev>; Mon, 09 Feb 2026 07:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770651983; x=1771256783; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1OHEgnUKWv1TUYnOaG9sRuh/khc2dgEeTjHa0FYOoXE=;
        b=b0ZErFJ3n7W12R9OL3/3yThmlhPgeFzrtZoJR1sUTa12A+l3wtjaL3aCEzo9Y3KTUe
         cO5eex0WpuWYxqZuqr6zKX4WBEpyupQz9fDCMDn1uX63uSKf+5VC0i1vl7uNtqD+AAb4
         wS5HRRFfG+354TK444o5wIeQtIn/wLBDBJfDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770651983; x=1771256783;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1OHEgnUKWv1TUYnOaG9sRuh/khc2dgEeTjHa0FYOoXE=;
        b=hnlCJ7ME09g7AnV3E/ejmn50lz5A5VQM4PRU8WvXa22n1pekrSPtSBQprgtXYbOABt
         w6y9zCRnGjXSMmouXECnBnbaY8shOCUn8n/Qw4wH1cztQy2VCkJiKesm5ChTNwfjOqRf
         wUOwH1m8bZpd+ykbqhnTrfDAXj5KmIKo/Nnv+YeDCpfnwJMsf3AKpELKq/Sq4TBPDrhL
         TfzX2DXamALX5Re3dx97/pPiaJYBfxDDqbFrk61D1PDlchGc8OgGL2D4te3WhTwKh6oS
         V78GHRNJXYXFGfpF2egQGMutPpWu2rQl4r69IuvZ0BBOaOwMmUMIiLvxQD/EUjt7vKor
         RBxA==
X-Forwarded-Encrypted: i=1; AJvYcCX+nWYziCN6dDvjxxdGp326jX1/G2vQjU3NOtcapn+YjA/tZfv+yzoaM4NwMpKjO4/rCC7aXBn6PJr5nMlcbPU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxoZQwxZfuou1YiKPRKTq/eY3iCNKiK5kvTd0P/zljazaeOAS0R
	Vkq2HKkQu7h1g2HGbjUMrNuA1d+dWrUS7xLbLJExexrFhVMD2TCpkXtD9eiwrGABwA==
X-Gm-Gg: AZuq6aKqC9B5XDR/CaE7243cjGVZVlsP7HKCTdqZTl8T+L3/inyyYarjjb8VMWvLzBh
	5lG/0PGBrG7s6dokw6uZkjNpcTnNkqwkSgto/DpvocSq3pUzgmBRRNisYFJl9FsJyKkdZ6V22X/
	LVlBTR9GKs5sqUL/kIEOjhc7I62ThyBfzu9vBHvyYbRW3LDOdMOY2RbqfMYrkukirHCITM71Mv5
	r+ZpBsorBLyZWwLRFRuRNhzp1j6UtwVt54YUtQJoO/miY55E94exBc3kx0Y925oy+Ff7ilYC6UZ
	8JKUZVovK7fsJ/yqVgMtzfCPo3oJJASjA5Iz0g0XFoao9GY8Tu0v4WlpHyv8xDMCgcfrM28c+uY
	mq6izcGRAv0GOSBabJanQt5NZSCJvbRyT5unQ3UKP1RY3qax7khwe28c7CJWqdftpNiwt0LHn2F
	3uekRKFhixPSpcvUTd7A==
X-Received: by 2002:a05:600c:ad7:b0:47d:52ef:c572 with SMTP id 5b1f17b1804b1-483178e303emr143850435e9.1.1770651982946;
        Mon, 09 Feb 2026 07:46:22 -0800 (PST)
Received: from google.com ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43631c8d378sm21793697f8f.21.2026.02.09.07.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 07:46:22 -0800 (PST)
Date: Mon, 9 Feb 2026 15:46:20 +0000
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Simon Glass <sjg@chromium.org>,
	linux-input@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/1] Input: cros_ec_keyb - add function key support
Message-ID: <aYoBTEgrirtcW96F@google.com>
References: <20260112093309.240905-1-fabiobaltieri@chromium.org>
 <20260112093309.240905-2-fabiobaltieri@chromium.org>
 <aYYTgxi0mcPVgpTr@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYYTgxi0mcPVgpTr@google.com>

On Fri, Feb 06, 2026 at 08:25:14AM -0800, Dmitry Torokhov wrote:
> Hi Fabio,
> 
> On Mon, Jan 12, 2026 at 09:33:09AM +0000, Fabio Baltieri wrote:
> > Add support for handling an Fn button and sending separate keycodes for
> > a subset of keys in the matrix defined in the upper half of the keymap.
> > 
> > Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
> > Reviewed-by: Simon Glass <sjg@chromium.org>
> > ---
> >  drivers/input/keyboard/cros_ec_keyb.c | 174 +++++++++++++++++++++++---
> >  1 file changed, 158 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
> > index 1c6b0461dc35..93540f0c5a33 100644
> > --- a/drivers/input/keyboard/cros_ec_keyb.c
> > +++ b/drivers/input/keyboard/cros_ec_keyb.c
> > @@ -29,6 +29,11 @@
> >  
> >  #include <linux/unaligned.h>
> >  
> > +/* Maximum size of the normal key matrix, this is limited by the host command
> > + * key_matrix field defined in ec_response_get_next_data_v3
> > + */
> 
> The comment format for multi-line comments is:
> 
> /*
>  * Line 1
>  * Line 2
>  */

Sure will fix it.

> 
> > +#define CROS_EC_KEYBOARD_COLS_MAX 18
> > +
> >  /**
> >   * struct cros_ec_keyb - Structure representing EC keyboard device
> >   *
> > @@ -44,6 +49,11 @@
> >   * @bs_idev: The input device for non-matrix buttons and switches (or NULL).
> >   * @notifier: interrupt event notifier for transport devices
> >   * @vdata: vivaldi function row data
> > + * @has_fn_map: whether the driver uses an fn function-map layer
> 
> I do not believe this flag is needed. Always do FN processing. If there
> is no FN in the keymap it should work just fine.

The problem is that if there is an Fn key and a keymap, hence we process
the Fn keys in the kernel, then we don't send the Fn events, but we
currently have devices deployed with an Fn key where the key is handled
by the userspace and they expect KEY_FN events to be emitted, so if I
let the "fn keymap" logic kick in it unconditionally it would cause a
regression for existing devices.

> 
> > + * @normal_key_status: active normal keys map
> > + * @fn_key_status: active function keys map
> 
> I do not think you need to track state yourself. A key will be reported
> either from FN part of map or from normal one, so when you get a release
> for (row, col) you can check if FN-mapped key is active (using
> text_bit(<fn-combo-code>, idev->key)) and if it is not active then send
> release event for the normal key.

Cool, yes that's the case, was able to get rid of both these two, thanks
for the pointer.

> 
> > + * @fn_key_pressed: tracks the function key status
> > + * @fn_key_triggered: tracks where any function key fired
> 
> Maybe it should be called fn_event_pending? You set it together with
> fn_key_pressed and clear if you get any other key press?

Sounds good I'll rename it.

> 
> >   */
> >  struct cros_ec_keyb {
> >  	unsigned int rows;
> > @@ -61,6 +71,12 @@ struct cros_ec_keyb {
> >  	struct notifier_block notifier;
> >  
> >  	struct vivaldi_data vdata;
> > +
> > +	bool has_fn_map;
> > +	u8 normal_key_status[CROS_EC_KEYBOARD_COLS_MAX];
> > +	u8 fn_key_status[CROS_EC_KEYBOARD_COLS_MAX];
> > +	bool fn_key_pressed;
> > +	bool fn_key_triggered;
> >  };
> >  
> >  /**
> > @@ -166,16 +182,104 @@ static bool cros_ec_keyb_has_ghosting(struct cros_ec_keyb *ckdev, uint8_t *buf)
> >  	return false;
> >  }
> >  
> > +/*
> > + * Process a function key state change, send an event report if appropriate.
> > + */
> > +static void cros_ec_keyb_process_fn_key(struct cros_ec_keyb *ckdev,
> > +					int row, int col, bool state)
> > +{
> > +	struct input_dev *idev = ckdev->idev;
> > +	int pos = MATRIX_SCAN_CODE(row, col, ckdev->row_shift);
> > +
> > +	ckdev->fn_key_pressed = state;
> > +
> > +	if (state) {
> > +		ckdev->fn_key_triggered = false;
> > +	} else if (!ckdev->fn_key_triggered) {
> > +		/*
> > +		 * Send the original code if nothing else has been pressed
> > +		 * together with Fn.
> > +		 */
> > +		input_event(idev, EV_MSC, MSC_SCAN, pos);
> > +		input_report_key(idev, KEY_FN, true);
> > +		input_sync(idev);
> > +
> > +		input_event(idev, EV_MSC, MSC_SCAN, pos);
> > +		input_report_key(idev, KEY_FN, false);
> 
> Why do we want this? If you want FN to behave like hardware switch you
> probably do not want to send KEY_FN at all?

Yeah normally you wouldn't want FN events, the problem though is that if
you don't send any events at all then a user may find a blanked screen,
hit the Fn key expecting it to unblank and instead it doesn't happen and
they assume the device is dead. My laptop does that too (in fact it
sends a KEY_WAKEUP).

Also I guess this behavior ultimately allows the userspace to bind
actions to the both the Fn key and Fn key function (imagine an UI like
"press the key to bind this event", if you emit Fn then it woulc capture
that one, if you never emit anything you just can't use it).

> 
> > +	}
> > +}
> > +
> > +/*
> > + * Return the Fn code for a normal key row, col combination, optionally set a
> > + * position code too.
> > + */
> > +static unsigned int cros_ec_keyb_fn_code(struct cros_ec_keyb *ckdev,
> > +					 int row, int col, int *pos)
> > +{
> > +	struct input_dev *idev = ckdev->idev;
> > +	const unsigned short *keycodes = idev->keycode;
> > +	int fn_pos = MATRIX_SCAN_CODE(row + ckdev->rows, col, ckdev->row_shift);
> > +
> > +	if (pos)
> > +		*pos = fn_pos;
> > +
> > +	return keycodes[fn_pos];
> > +}
> > +
> > +/*
> > + * Process the new state for a single key.
> > + */
> > +static void cros_ec_keyb_process_one(struct cros_ec_keyb *ckdev,
> > +				     int row, int col, bool state)
> > +{
> > +	struct input_dev *idev = ckdev->idev;
> > +	const unsigned short *keycodes = idev->keycode;
> > +	int pos = MATRIX_SCAN_CODE(row, col, ckdev->row_shift);
> > +	unsigned int code = keycodes[pos];
> > +
> > +	dev_dbg(ckdev->dev, "changed: [r%d c%d]: byte %02x\n", row, col, state);
> > +
> > +	if (ckdev->has_fn_map) {
> > +		if (code == KEY_FN)
> > +			return cros_ec_keyb_process_fn_key(ckdev, row, col, state);
> > +
> > +		if (!state) {
> > +			if (ckdev->fn_key_status[col] & BIT(row)) {
> > +				code = cros_ec_keyb_fn_code(ckdev, row, col, &pos);
> > +
> > +				ckdev->fn_key_status[col] &= ~BIT(row);
> > +			} else if (ckdev->normal_key_status[col] & BIT(row)) {
> > +				ckdev->normal_key_status[col] &= ~BIT(row);
> > +			} else {
> > +				/* Discard, key press code was not sent */
> > +				return;
> > +			}
> > +		} else if (ckdev->fn_key_pressed) {
> > +			code = cros_ec_keyb_fn_code(ckdev, row, col, &pos);
> > +
> > +			ckdev->fn_key_triggered = true;
> > +
> > +			if (!code)
> > +				return;
> > +
> > +			ckdev->fn_key_status[col] |= BIT(row);
> > +		} else {
> > +			ckdev->normal_key_status[col] |= BIT(row);
> > +		}
> > +	}
> > +
> > +	input_event(idev, EV_MSC, MSC_SCAN, pos);
> > +	input_report_key(idev, code, state);
> > +}
> >  
> >  /*
> >   * Compares the new keyboard state to the old one and produces key
> > - * press/release events accordingly.  The keyboard state is 13 bytes (one byte
> > - * per column)
> > + * press/release events accordingly.  The keyboard state is one byte
> > + * per column.
> >   */
> >  static void cros_ec_keyb_process(struct cros_ec_keyb *ckdev,
> >  			 uint8_t *kb_state, int len)
> >  {
> > -	struct input_dev *idev = ckdev->idev;
> >  	int col, row;
> >  	int new_state;
> >  	int old_state;
> > @@ -192,20 +296,13 @@ static void cros_ec_keyb_process(struct cros_ec_keyb *ckdev,
> >  
> >  	for (col = 0; col < ckdev->cols; col++) {
> >  		for (row = 0; row < ckdev->rows; row++) {
> > -			int pos = MATRIX_SCAN_CODE(row, col, ckdev->row_shift);
> > -			const unsigned short *keycodes = idev->keycode;
> > -
> >  			new_state = kb_state[col] & (1 << row);
> >  			old_state = ckdev->old_kb_state[col] & (1 << row);
> > -			if (new_state != old_state) {
> > -				dev_dbg(ckdev->dev,
> > -					"changed: [r%d c%d]: byte %02x\n",
> > -					row, col, new_state);
> > -
> > -				input_event(idev, EV_MSC, MSC_SCAN, pos);
> > -				input_report_key(idev, keycodes[pos],
> > -						 new_state);
> > -			}
> > +
> > +			if (new_state == old_state)
> > +				continue;
> > +
> > +			cros_ec_keyb_process_one(ckdev, row, col, new_state);
> >  		}
> >  		ckdev->old_kb_state[col] = kb_state[col];
> >  	}
> > @@ -582,6 +679,43 @@ static void cros_ec_keyb_parse_vivaldi_physmap(struct cros_ec_keyb *ckdev)
> >  	ckdev->vdata.num_function_row_keys = n_physmap;
> >  }
> >  
> > +/* Returns true if there is a KEY_FN code defined in the normal keymap */
> > +static bool cros_ec_keyb_has_fn_key(struct cros_ec_keyb *ckdev)
> > +{
> > +	struct input_dev *idev = ckdev->idev;
> > +	const unsigned short *keycodes = idev->keycode;
> > +
> > +	for (int row = 0; row < ckdev->rows; row++) {
> > +		for (int col = 0; col < ckdev->cols; col++) {
> > +			int pos = MATRIX_SCAN_CODE(row, col, ckdev->row_shift);
> > +
> > +			if (keycodes[pos] == KEY_FN)
> > +				return true;
> > +		}
> > +	}
> > +
> > +	return false;
> > +}
> 
> Not needed.
> 
> > +
> > +/*
> > + * Returns true if there is a KEY_FN defined and at least one key in the fn
> > + * layer keymap
> > + */
> > +static bool cros_ec_keyb_has_fn_map(struct cros_ec_keyb *ckdev)
> > +{
> > +	if (!cros_ec_keyb_has_fn_key(ckdev))
> > +		return false;
> > +
> > +	for (int row = 0; row < ckdev->rows; row++) {
> > +		for (int col = 0; col < ckdev->cols; col++) {
> > +			if (cros_ec_keyb_fn_code(ckdev, row, col, NULL) != 0)
> > +				return true;
> > +		}
> > +	}
> > +
> > +	return false;
> > +}
> 
> I do not think this is needed either.

See my comment about has_fn_map.
