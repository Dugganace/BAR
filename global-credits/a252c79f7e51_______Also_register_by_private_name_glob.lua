--
            -- Also register by private name globally as fallback.
            -- This does NOT dirty original shared weapondefs.
            ------------------------------------------------

            if WeaponDefs then
                WeaponDefs[privateName]=copyTable(privateWd)
            end

            if WeaponDefNames then
                WeaponDefNames[privateName]=copyTable(privateWd)
            end

            w.def=privateName
            w.weapondef=privateName
            w.weaponDef=privateName
            w.name=privateName
        end
    end
end
